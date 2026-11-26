import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:skelter/presentation/chat/bloc/chat_conversation_bloc.dart';
import 'package:skelter/presentation/chat/bloc/chat_conversation_event.dart';
import 'package:skelter/presentation/chat/bloc/chat_conversation_state.dart';
import 'package:skelter/presentation/chat/chat_conversations.dart';
import 'package:skelter/presentation/chat/domain/entities/chat_text_message_entity.dart';
import 'package:skelter/presentation/chat/model/chat_model.dart';
import 'package:skelter/widgets/styling/app_theme_data.dart';

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

class MockChatConversationBloc
    extends MockBloc<ChatConversationEvent, ChatConversationState>
    implements ChatConversationBloc {}

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
        final chatConversationBloc = MockChatConversationBloc();
        when(() => chatConversationBloc.state).thenReturn(_sampleLoadedState());
        when(() => chatConversationBloc.currentUserId).thenReturn('uid_self');

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'Chat conversation page Light Theme',
              providers: [
                BlocProvider<ChatConversationBloc>.value(
                  value: chatConversationBloc,
                ),
              ],
              child: ChatConversationWrapper(chatUser: sampleData[0]),
            ),
            createTestScenario(
              name: 'Chat conversation page Dark Theme',
              providers: [
                BlocProvider<ChatConversationBloc>.value(
                  value: chatConversationBloc,
                ),
              ],
              child: ChatConversationWrapper(chatUser: sampleData[0]),
              theme: AppThemeEnum.DarkTheme,
            ),
          ],
        );
      },
    );
  });
}

ChatConversationState _sampleLoadedState() {
  final messages = [
    ChatTextMessageEntity(
      id: 'm5',
      chatId: 'c1',
      senderId: 'uid_self',
      text: 'What documents I have to bring?',
      createdAt: DateTime(2025, 1, 1, 9, 46),
    ),
    ChatTextMessageEntity(
      id: 'm4',
      chatId: 'c1',
      senderId: 'uid_other',
      text: 'Hey, Good Morning',
      createdAt: DateTime(2025, 1, 1, 9, 45),
    ),
    ChatTextMessageEntity(
      id: 'm3',
      chatId: 'c1',
      senderId: 'uid_self',
      text: 'Hey, Thanks for scheduling the shift',
      createdAt: DateTime(2025, 1, 1, 9, 40),
    ),
  ];
  return ChatConversationState.test(messages: messages);
}
