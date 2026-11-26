import 'package:alchemist/alchemist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/presentation/server_error/server_error_screen.dart';
import 'package:skelter/widgets/styling/app_theme_data.dart';

import '../../flutter_test_config.dart';
import '../../test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testExecutable(() {
    group('Server Error Screen UI Golden Tests', () {
      goldenTest(
        'ServerErrorScreen',
        fileName: 'server_error_screen',
        pumpBeforeTest: precacheImages,
        builder: () {
          return GoldenTestGroup(
            columnWidthBuilder: (_) =>
                const FixedColumnWidth(pixel5DeviceWidth),
            children: [
              createTestScenario(
                name: 'Server Error Screen Light Theme',
                child: const ServerErrorScreen(),
              ),
              createTestScenario(
                name: 'Server Error Screen Dark Theme',
                theme: AppThemeEnum.DarkTheme,
                child: const ServerErrorScreen(),
              ),
            ],
          );
        },
      );
    });
  });
}
