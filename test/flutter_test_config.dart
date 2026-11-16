import 'dart:async';

import 'package:alchemist/alchemist.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skelter/widgets/styling/app_theme_data.dart';

/// Max share of differing pixels (0.1%) a golden may have and still pass.
///
/// Goldens are generated on a developer Mac but compared on the CI macOS
/// runner. Different macOS versions anti-alias text and icon edges slightly
/// differently (typically 20–70px, ≤0.01%), which would fail exact matching.
/// Real layout or colour regressions are far above this threshold.
const double _goldenDiffTolerance = 0.001;

Future<void> testExecutable(
  FutureOr<void> Function() testMain, {
  bool forceUpdateGoldenFiles = false,
}) async {
  final comparator = goldenFileComparator;
  if (comparator is LocalFileComparator) {
    goldenFileComparator = _TolerantGoldenFileComparator(
      // LocalFileComparator resolves goldens relative to this file's directory.
      Uri.parse('${comparator.basedir}flutter_test_config.dart'),
      tolerance: _goldenDiffTolerance,
    );
  }

  const isRunningInCi = bool.fromEnvironment('CI');
  return AlchemistConfig.runWithConfig(
    config: AlchemistConfig(
      theme: AppThemesData.themeData[AppThemeEnum.LightTheme],
      forceUpdateGoldenFiles: forceUpdateGoldenFiles,
      platformGoldensConfig: const PlatformGoldensConfig(
        enabled: !isRunningInCi, // ignore: avoid_redundant_argument_values
      ),
      ciGoldensConfig: const CiGoldensConfig(enabled: isRunningInCi),
    ),
    run: testMain,
  );
}

class _TolerantGoldenFileComparator extends LocalFileComparator {
  _TolerantGoldenFileComparator(super.testFile, {required this.tolerance});

  final double tolerance;

  @override
  Future<bool> compare(Uint8List imageBytes, Uri golden) async {
    final result = await GoldenFileComparator.compareLists(
      imageBytes,
      await getGoldenBytes(golden),
    );

    if (result.passed || result.diffPercent <= tolerance) {
      result.dispose();
      return true;
    }

    final error = await generateFailureOutput(result, golden, basedir);
    result.dispose();
    throw FlutterError(error);
  }
}

const pixel5DeviceHeight = 896.0;
const pixel5DeviceWidth = 411.0;
