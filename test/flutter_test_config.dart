import 'dart:async';

import 'package:alchemist/alchemist.dart';
import 'package:flutter_skeleton/widgets/styling/app_theme_data.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  const isRunningInCi = bool.fromEnvironment('CI');

  return AlchemistConfig.runWithConfig(
    config: AlchemistConfig(
      theme: AppThemesData.themeData[AppThemeEnum.LightTheme],
      ciGoldensConfig: const CiGoldensConfig(
        enabled: isRunningInCi,
      ),
    ),
    run: testMain,
  );
}
