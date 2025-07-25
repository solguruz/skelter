import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/presentation/account_delete_success/account_delete_success_screen.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../flutter_test_config.dart';
import '../../test_helpers.dart';

void main() {
  group('AccountDeleteSuccessScreen Golden Tests', () {
    goldenTest(
      'AccountDeleteSuccessScreen - Default UI',
      fileName: 'account_delete_success_screen',
      pumpBeforeTest: precacheImages,
      builder: () {
        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'Default AccountDeleteSuccessScreen',
              child: const AccountDeleteSuccessScreen(),
              addScaffold: true,
            ),
          ],
        );
      },
    );
  });
}
