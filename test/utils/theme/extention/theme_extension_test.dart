import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/utils/theme/dark_app_colors.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';
import 'package:skelter/utils/theme/light_app_colors.dart';

void main() {
  group('ThemeExtension', () {
    Widget buildTestWidget({
      required Brightness brightness,
      required Widget child,
    }) {
      return MaterialApp(
        theme: ThemeData(brightness: Brightness.light),
        darkTheme: ThemeData(brightness: Brightness.dark),
        themeMode: brightness == Brightness.dark
            ? ThemeMode.dark
            : ThemeMode.light,
        home: child,
      );
    }

    group('isDark', () {
      testWidgets('should return false when theme is light', (tester) async {
        bool? result;

        await tester.pumpWidget(
          buildTestWidget(
            brightness: Brightness.light,
            child: Builder(
              builder: (context) {
                result = context.isDark;
                return const SizedBox.shrink();
              },
            ),
          ),
        );

        expect(result, isFalse);
      });

      testWidgets('should return true when theme is dark', (tester) async {
        bool? result;

        await tester.pumpWidget(
          buildTestWidget(
            brightness: Brightness.dark,
            child: Builder(
              builder: (context) {
                result = context.isDark;
                return const SizedBox.shrink();
              },
            ),
          ),
        );

        expect(result, isTrue);
      });
    });

    group('currentTheme', () {
      testWidgets('should return LightAppColors when theme is light', (
        tester,
      ) async {
        dynamic result;

        await tester.pumpWidget(
          buildTestWidget(
            brightness: Brightness.light,
            child: Builder(
              builder: (context) {
                result = context.currentTheme;
                return const SizedBox.shrink();
              },
            ),
          ),
        );

        expect(result, isA<LightAppColors>());
      });

      testWidgets('should return DarkAppColors when theme is dark', (
        tester,
      ) async {
        dynamic result;

        await tester.pumpWidget(
          buildTestWidget(
            brightness: Brightness.dark,
            child: Builder(
              builder: (context) {
                result = context.currentTheme;
                return const SizedBox.shrink();
              },
            ),
          ),
        );

        expect(result, isA<DarkAppColors>());
      });
    });

    group('themeAsset', () {
      testWidgets('should return light value when theme is light', (
        tester,
      ) async {
        String? result;

        await tester.pumpWidget(
          buildTestWidget(
            brightness: Brightness.light,
            child: Builder(
              builder: (context) {
                result = context.themeAsset(
                  light: 'light_asset',
                  dark: 'dark_asset',
                );
                return const SizedBox.shrink();
              },
            ),
          ),
        );

        expect(result, equals('light_asset'));
      });

      testWidgets('should return dark value when theme is dark', (
        tester,
      ) async {
        String? result;

        await tester.pumpWidget(
          buildTestWidget(
            brightness: Brightness.dark,
            child: Builder(
              builder: (context) {
                result = context.themeAsset(
                  light: 'light_asset',
                  dark: 'dark_asset',
                );
                return const SizedBox.shrink();
              },
            ),
          ),
        );

        expect(result, equals('dark_asset'));
      });

      testWidgets('should work with integer asset values', (tester) async {
        int? result;

        await tester.pumpWidget(
          buildTestWidget(
            brightness: Brightness.dark,
            child: Builder(
              builder: (context) {
                result = context.themeAsset(light: 1, dark: 2);
                return const SizedBox.shrink();
              },
            ),
          ),
        );

        expect(result, equals(2));
      });
    });
  });
}
