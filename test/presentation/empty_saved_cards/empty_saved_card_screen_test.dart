import 'package:alchemist/alchemist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/presentation/empty_saved_cards/empty_saved_card_screen.dart';
import 'package:skelter/widgets/styling/app_theme_data.dart';

import '../../flutter_test_config.dart';
import '../../test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testExecutable(() {
    group('Empty Saved Card Screen UI Golden Tests', () {
      goldenTest(
        'EmptySavedCardScreen',
        fileName: 'empty_saved_card_screen',
        pumpBeforeTest: precacheImages,
        builder: () {
          return GoldenTestGroup(
            columnWidthBuilder: (_) =>
                const FixedColumnWidth(pixel5DeviceWidth),
            children: [
              createTestScenario(
                name: 'Empty Saved Card Screen Light Theme',
                child: const EmptySavedCardScreen(),
              ),
              createTestScenario(
                name: 'Empty Saved Card Screen Dark Theme',
                theme: AppThemeEnum.DarkTheme,
                child: const EmptySavedCardScreen(),
              ),
            ],
          );
        },
      );
    });
  });
}
