import 'dart:async';

import 'package:alchemist/alchemist.dart';
import 'package:flutter_skeleton/widgets/styling/app_theme_data.dart';

Future<void> testExecutable(
  FutureOr<void> Function() testMain, {
  bool forceUpdateGoldenFiles = false,
}) async {
  const isRunningInCi = bool.fromEnvironment('CI');
  return AlchemistConfig.runWithConfig(
    config: AlchemistConfig(
      theme: AppThemesData.themeData[AppThemeEnum.LightTheme],
      forceUpdateGoldenFiles: forceUpdateGoldenFiles,
      platformGoldensConfig: const PlatformGoldensConfig(
        enabled: !isRunningInCi,
      ),
      ciGoldensConfig: const CiGoldensConfig(
        enabled: isRunningInCi,
      ),
    ),
    run: testMain,
  );
}

const pixel5DeviceHeight = 896.0;
const pixel5DeviceWidth = 411.0;
