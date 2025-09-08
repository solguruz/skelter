import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skelter/presentation/ssl_pinning/ssl_connection_failed_screen.dart';

import '../../flutter_test_config.dart';
import '../../test_helpers.dart';

void main() {
  group('SSLConnectionFailedScreen Golden Tests', () {
    goldenTest(
      'SSLConnectionFailedScreen-UI',
      fileName: 'ssl_connection_failed_screen',
      pumpBeforeTest: precacheImages,
      builder: () {
        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'SSLConnectionFailedScreen',
              child: const SslConnectionFailedScreen(),
              addScaffold: true,
            ),
          ],
        );
      },
    );
  });
}
