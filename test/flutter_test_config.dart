import 'dart:async';

import 'package:alchemist/alchemist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skelter/widgets/styling/app_theme_data.dart';

import 'pixel_tolerant_golden_comparator.dart';

Future<void> testExecutable(
  FutureOr<void> Function() testMain, {
  bool forceUpdateGoldenFiles = false,
}) async {
  final comparator = goldenFileComparator;
  if (comparator is LocalFileComparator) {
    // Keep the goldens resolved relative to the running test file.
    goldenFileComparator = PixelTolerantGoldenFileComparator(
      comparator.basedir.resolve('flutter_test_config.dart'),
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

const pixel5DeviceHeight = 896.0;
const pixel5DeviceWidth = 411.0;
