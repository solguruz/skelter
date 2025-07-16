import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_skeleton/presentation/chat/chat_conversations.dart';
import 'package:flutter_skeleton/presentation/chat/model/chat_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import '../../flutter_test_config.dart';
import '../../test_app_cache_manager.dart';
import '../../test_helpers.dart';
import 'data/chat_sample_data.dart';

class FakePathProviderPlatform extends Fake
    with MockPlatformInterfaceMixin
    implements PathProviderPlatform {
  @override
  Future<String?> getTemporaryPath() async => '/tmp/test';

  @override
  Future<String?> getApplicationSupportPath() async => '/tmp/support/test';
}

late BaseCacheManager mockCacheManager;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() {
    mockCacheManager = MockAppImageCacheManager();
    PathProviderPlatform.instance = FakePathProviderPlatform();
  });

  testExecutable(() {
    final List<ChatModel> sampleData = generateSampleUsersChat();
    goldenTest(
      'Chat conversation page',
      fileName: 'chat_conversation_page',
      builder: () {
        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'Chat conversation page',
              child: ChatConversationScreen(
                chatUser: sampleData[0],
              ),
            ),
          ],
        );
      },
    );
  });
}
