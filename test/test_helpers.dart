import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/widgets/styling/app_theme_data.dart';
import 'package:flutter_test/flutter_test.dart';

extension WidgetTestHelper on WidgetTester {
  Future<void> runWidgetTest({
    required Widget child,
    List<BlocProvider> providers = const [],
  }) async {
    return pumpWidget(
      MaterialApp(
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
    width: 411, // Logical width of Pixel 5
    height: 896, // Logical height of Pixel 5
    child: addScaffold ? Scaffold(body: Center(child: child)) : child,
  );

  return GoldenTestScenario(
    name: name,
    child: MaterialApp(
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
    ),
  );
}
