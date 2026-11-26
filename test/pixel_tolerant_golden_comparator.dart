import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

/// Largest per-channel colour difference (out of 255) a pixel may have and
/// still match its golden.
///
/// Goldens are generated on a developer Mac but compared on the CI macOS
/// runner. Different macOS versions anti-alias text and icon edges slightly
/// differently (up to 11/255 seen on CI). Real colour changes, and content
/// that moves or resizes, change pixels by far more than this.
const int goldenChannelTolerance = 16;

/// A [LocalFileComparator] that ignores pixels whose colour differs from the
/// golden by at most [channelTolerance] in every RGBA channel.
///
/// Images of different sizes, or with any pixel differing by more than
/// [channelTolerance] in any channel, still fail with the usual diff output.
class PixelTolerantGoldenFileComparator extends LocalFileComparator {
  PixelTolerantGoldenFileComparator(
    super.testFile, {
    this.channelTolerance = goldenChannelTolerance,
  });

  final int channelTolerance;

  @override
  Future<bool> compare(Uint8List imageBytes, Uri golden) async {
    final goldenBytes = await getGoldenBytes(golden);
    final result = await GoldenFileComparator.compareLists(
      imageBytes,
      goldenBytes,
    );

    if (result.passed || await isWithinTolerance(imageBytes, goldenBytes)) {
      result.dispose();
      return true;
    }

    final error = await generateFailureOutput(result, golden, basedir);
    result.dispose();
    throw FlutterError(error);
  }

  /// Whether [test] and [master] have the same size and no channel of any
  /// pixel differs by more than [channelTolerance].
  @visibleForTesting
  Future<bool> isWithinTolerance(List<int> test, List<int> master) async {
    final testImage = await _decode(test);
    final masterImage = await _decode(master);
    try {
      if (testImage.width != masterImage.width ||
          testImage.height != masterImage.height) {
        return false;
      }
      final testPixels = await _rgba(testImage);
      final masterPixels = await _rgba(masterImage);
      for (var i = 0; i < testPixels.length; i++) {
        if ((testPixels[i] - masterPixels[i]).abs() > channelTolerance) {
          return false;
        }
      }
      return true;
    } finally {
      testImage.dispose();
      masterImage.dispose();
    }
  }

  static Future<ui.Image> _decode(List<int> bytes) async {
    final codec = await ui.instantiateImageCodec(Uint8List.fromList(bytes));
    final frame = await codec.getNextFrame();
    codec.dispose();
    return frame.image;
  }

  static Future<Uint8List> _rgba(ui.Image image) async {
    final data = await image.toByteData();
    return data!.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }
}
