import 'package:alchemist/alchemist.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skelter/presentation/change_theme/change_theme_screen.dart';
import 'package:skelter/utils/theme/bloc/theme_bloc.dart';
import 'package:skelter/utils/theme/bloc/theme_state.dart';
import 'package:skelter/widgets/styling/app_theme_data.dart';

import '../../flutter_test_config.dart';
import '../../test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ChangeThemeScreen Widget Test', () {
    testWidgets('renders correctly', (tester) async {
      await tester.runWidgetTest(child: const ChangeThemeScreen());
      expect(find.byType(ChangeThemeScreen), findsOneWidget);
    });
  });

  testExecutable(() {
    group('ChangeThemeScreen Golden Tests', () {
      goldenTest(
        'ChangeThemeScreen',
        fileName: 'change_theme_screen',
        pumpBeforeTest: precacheImages,
        builder: () {
          final systemThemeBloc = MockThemeBloc();
          when(() => systemThemeBloc.state).thenReturn(const ThemeState.test());

          final lightThemeBloc = MockThemeBloc();
          when(
            () => lightThemeBloc.state,
          ).thenReturn(const ThemeState.test(themeMode: ThemeMode.light));

          final darkThemeBloc = MockThemeBloc();
          when(
            () => darkThemeBloc.state,
          ).thenReturn(const ThemeState.test(themeMode: ThemeMode.dark));

          return GoldenTestGroup(
            columnWidthBuilder: (_) =>
                const FixedColumnWidth(pixel5DeviceWidth),
            children: [
              createTestScenario(
                name: 'system selected',
                child: const ChangeThemeScreen(),
                providers: [
                  BlocProvider<ThemeBloc>.value(value: systemThemeBloc),
                ],
              ),
              createTestScenario(
                name: 'light selected',
                child: const ChangeThemeScreen(),
                providers: [
                  BlocProvider<ThemeBloc>.value(value: lightThemeBloc),
                ],
              ),
              createTestScenario(
                name: 'dark selected',
                theme: AppThemeEnum.DarkTheme,
                child: const ChangeThemeScreen(),
                providers: [
                  BlocProvider<ThemeBloc>.value(value: darkThemeBloc),
                ],
              ),
            ],
          );
        },
      );
    });
  });
}
