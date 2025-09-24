import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skelter/presentation/account_delete_success/account_delete_success_screen.dart';
import 'package:skelter/widgets/styling/app_theme_data.dart';

import '../../flutter_test_config.dart';
import '../../test_helpers.dart';

void main() {
  group('AccountDeleteSuccessScreen Golden Tests', () {
    goldenTest(
      'AccountDeleteSuccessScreen UI',
      fileName: 'account_delete_success_screen',
      pumpBeforeTest: precacheImages,
      builder: () {
        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'AccountDeleteSuccessScreen Light Theme',
              child: const AccountDeleteSuccessScreen(),
              addScaffold: true,
            ),
            createTestScenario(
              name: 'AccountDeleteSuccessScreen Dark Theme',
              child: const AccountDeleteSuccessScreen(),
              addScaffold: true,
              theme: AppThemeEnum.DarkTheme,
            ),
          ],
        );
      },
    );
  });
}
