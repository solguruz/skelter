import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/presentation/settings/settings_screen.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../flutter_test_config.dart';
import '../../test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SettingsScreen Widget Test', () {
    testWidgets('renders correctly', (tester) async {
      await tester.runWidgetTest(
        child: const SettingsScreen(),
      );

      expect(find.byType(SettingsScreen), findsOneWidget);
      expect(find.byType(SettingsScreenBody), findsOneWidget);
    });
  });

  testExecutable(() {
    group('Settings Screen UI Golden Tests', () {
      goldenTest(
        'SettingsScreen',
        fileName: 'settings_screen',
        pumpBeforeTest: precacheImages,
        builder: () {
          return GoldenTestGroup(
            columnWidthBuilder: (_) =>
                const FixedColumnWidth(pixel5DeviceWidth),
            children: [
              createTestScenario(
                name: 'SettingsScreen',
                child: const SettingsScreen(),
              ),
            ],
          );
        },
      );
    });
  });
}
