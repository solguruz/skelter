import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sizer/sizer.dart';
import 'package:skelter/i18n/app_localizations.dart';
import 'package:skelter/utils/theme/bloc/theme_bloc.dart';
import 'package:skelter/utils/theme/bloc/theme_event.dart';
import 'package:skelter/utils/theme/bloc/theme_state.dart';
import 'package:skelter/widgets/styling/app_theme_data.dart';
import 'package:skelter/widgets/styling/legacy_material_bridge.dart';

import 'flutter_test_config.dart';

class MockThemeBloc extends MockBloc<ThemeEvent, ThemeState>
    implements ThemeBloc {}

class MockAppLocalizations extends Mock implements AppLocalizations {}

class MockLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  final AppLocalizations mockLocalizations;

  const MockLocalizationsDelegate(this.mockLocalizations);

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<AppLocalizations> load(Locale locale) =>
      SynchronousFuture(mockLocalizations);

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}

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
              BlocProvider<ThemeBloc>(create: (context) => themeBloc),
              ...providers,
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppThemesData.themeData[theme],
              localizationsDelegates: const [AppLocalizations.delegate],
              builder: (context, child) => LegacyMaterialBridge(child: child!),
              home: child,
            ),
          );
        },
      ),
    );
  }

  Future<T?> runValidator<T>(
    MockAppLocalizations l10n,
    T? Function(BuildContext) run,
  ) async {
    T? result;
    await pumpWidget(
      MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: [MockLocalizationsDelegate(l10n)],
        home: Builder(
          builder: (context) {
            result = run(context);
            return const SizedBox.shrink();
          },
        ),
      ),
    );
    return result;
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
            BlocProvider<ThemeBloc>(create: (context) => themeBloc),
            ...providers,
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppThemesData.themeData[theme],
            localizationsDelegates: const [AppLocalizations.delegate],
            builder: (context, child) => LegacyMaterialBridge(child: child!),
            home: childWithDeviceSize,
          ),
        );
      },
    ),
  );
}
