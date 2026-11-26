import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'pixel_tolerant_golden_comparator.dart';

const _base = ui.Color.fromARGB(255, 100, 100, 100);

/// A [width] x [height] PNG filled with [_base], with the pixel at (1, 1)
/// painted [pixel] when given.
Future<Uint8List> _png({int width = 4, int height = 4, ui.Color? pixel}) async {
  final recorder = ui.PictureRecorder();
  final canvas = ui.Canvas(recorder)
    ..drawRect(
      ui.Rect.fromLTWH(0, 0, width.toDouble(), height.toDouble()),
      ui.Paint()..color = _base,
    );
  if (pixel != null) {
    canvas.drawRect(
      const ui.Rect.fromLTWH(1, 1, 1, 1),
      ui.Paint()
        ..isAntiAlias = false
        ..color = pixel,
    );
  }
  final picture = recorder.endRecording();
  final image = await picture.toImage(width, height);
  final data = await image.toByteData(format: ui.ImageByteFormat.png);
  picture.dispose();
  image.dispose();
  return data!.buffer.asUint8List();
}

void main() {
  late Directory tempDir;
  late PixelTolerantGoldenFileComparator comparator;

  setUp(() {
    tempDir = Directory.systemTemp.createTempSync('golden_comparator_test');
    comparator = PixelTolerantGoldenFileComparator(
      tempDir.uri.resolve('fake_test.dart'),
    );
  });

  tearDown(() => tempDir.deleteSync(recursive: true));

  test('passes when a pixel differs by the tolerance in a channel', () async {
    final master = await _png();
    final test = await _png(
      pixel: const ui.Color.fromARGB(
        255,
        100 + goldenChannelTolerance,
        100,
        100,
      ),
    );

    expect(await comparator.isWithinTolerance(test, master), isTrue);
  });

  test('fails when a pixel differs by more than the tolerance', () async {
    final master = await _png();
    final test = await _png(
      pixel: const ui.Color.fromARGB(
        255,
        100,
        100,
        100 + goldenChannelTolerance + 1,
      ),
    );

    expect(await comparator.isWithinTolerance(test, master), isFalse);
  });

  test('fails when the image size differs', () async {
    final master = await _png();
    final test = await _png(width: 5);

    expect(await comparator.isWithinTolerance(test, master), isFalse);
  });

  test('compare accepts a golden within the tolerance', () async {
    File.fromUri(tempDir.uri.resolve('golden.png'))
        .writeAsBytesSync(await _png());
    final test = await _png(
      pixel: const ui.Color.fromARGB(
        255,
        100,
        100 - goldenChannelTolerance,
        100,
      ),
    );

    expect(await comparator.compare(test, Uri.parse('golden.png')), isTrue);
  });

  test('compare throws with diff output beyond the tolerance', () async {
    File.fromUri(tempDir.uri.resolve('golden.png'))
        .writeAsBytesSync(await _png());
    final test = await _png(pixel: const ui.Color.fromARGB(255, 0, 0, 0));

    await expectLater(
      comparator.compare(test, Uri.parse('golden.png')),
      throwsA(isA<FlutterError>()),
    );
  });
}
