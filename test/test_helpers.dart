import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/widgets/styling/app_theme_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

import 'flutter_test_config.dart';

extension WidgetTestHelper on WidgetTester {
  Future<void> runWidgetTest({
    required Widget child,
    List<BlocProvider> providers = const [],
  }) async {
    return pumpWidget(
      Sizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppThemesData.themeData[AppThemeEnum.LightTheme],
            localizationsDelegates: const [
              AppLocalizations.delegate,
            ],
            home: providers.isNotEmpty
                ? MultiBlocProvider(
                    providers: providers,
                    child: child,
                  )
                : child,
          );
        },
      ),
    );
  }
}

GoldenTestScenario createTestScenario({
  required String name,
  required Widget child,
  List<BlocProvider> providers = const [],
  bool addScaffold = false,
}) {
  final childWithDeviceSize = SizedBox(
    width: pixel5DeviceWidth,
    height: pixel5DeviceHeight,
    child: addScaffold
        ? Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(child: child),
            ),
          )
        : child,
  );

  return GoldenTestScenario(
    name: name,
    child: Sizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppThemesData.themeData[AppThemeEnum.LightTheme],
          localizationsDelegates: const [
            AppLocalizations.delegate,
          ],
          home: providers.isNotEmpty
              ? MultiBlocProvider(
                  providers: providers,
                  child: childWithDeviceSize,
                )
              : childWithDeviceSize,
        );
      },
    ),
  );
}
