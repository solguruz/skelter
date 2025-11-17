import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sizer/sizer.dart';
import 'package:skelter/i18n/app_localizations.dart';
import 'package:skelter/utils/theme/bloc/theme_bloc.dart';
import 'package:skelter/utils/theme/bloc/theme_event.dart';
import 'package:skelter/utils/theme/bloc/theme_state.dart';
import 'package:skelter/widgets/styling/app_theme_data.dart';

import 'flutter_test_config.dart';

class MockThemeBloc extends MockBloc<ThemeEvent, ThemeState>
    implements ThemeBloc {}

extension WidgetTestHelper on WidgetTester {
  Future<void> runWidgetTest({
    required Widget child,
    List<BlocProvider> providers = const [],
    AppThemeEnum theme = AppThemeEnum.LightTheme,
  }) async {
    final themeBloc = MockThemeBloc();

    const themeState = ThemeState.test();
    when(() => themeBloc.state).thenReturn(themeState);

    return pumpWidget(
      Sizer(
        builder: (context, orientation, screenType) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<ThemeBloc>(
                create: (context) => themeBloc,
              ),
              ...providers,
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppThemesData.themeData[theme],
              localizationsDelegates: const [
                AppLocalizations.delegate,
              ],
              home: child,
            ),
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
  AppThemeEnum theme = AppThemeEnum.LightTheme,
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
        final themeBloc = MockThemeBloc();

        const themeState = ThemeState.test();
        when(() => themeBloc.state).thenReturn(themeState);

        return MultiBlocProvider(
          providers: [
            BlocProvider<ThemeBloc>(
              create: (context) => themeBloc,
            ),
            ...providers,
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppThemesData.themeData[theme],
            localizationsDelegates: const [
              AppLocalizations.delegate,
            ],
            home: childWithDeviceSize,
          ),
        );
      },
    ),
  );
}
