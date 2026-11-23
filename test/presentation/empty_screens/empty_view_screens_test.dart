import 'package:alchemist/alchemist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/presentation/empty_screens/empty_view_screens.dart';
import 'package:skelter/widgets/styling/app_theme_data.dart';

import '../../flutter_test_config.dart';
import '../../test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testExecutable(() {
    goldenTest(
      'Empty views screen',
      fileName: 'empty_views_screen',
      builder: () => GoldenTestGroup(
        columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
        children: [
          createTestScenario(
            name: 'Light Theme',
            child: const EmptyViewsScreen(),
          ),
          createTestScenario(
            name: 'Dark Theme',
            theme: AppThemeEnum.DarkTheme,
            child: const EmptyViewsScreen(),
          ),
        ],
      ),
    );
  });
}
