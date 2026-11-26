import 'package:alchemist/alchemist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/presentation/ai_chat/widgets/ai_chat_fab.dart';
import 'package:skelter/widgets/styling/app_theme_data.dart';

import '../../flutter_test_config.dart';
import '../../test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testExecutable(() {
    goldenTest(
      'AI chat FAB UI test',
      fileName: 'ai_chat_fab',
      builder: () {
        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'ai_chat_fab Light Theme',
              addScaffold: true,
              child: const AiChatFab(),
            ),
            createTestScenario(
              name: 'ai_chat_fab Dark Theme',
              addScaffold: true,
              theme: AppThemeEnum.DarkTheme,
              child: const AiChatFab(),
            ),
          ],
        );
      },
    );
  });
}
