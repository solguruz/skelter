import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:skelter/presentation/chat/bloc/chat_users_bloc.dart';
import 'package:skelter/presentation/chat/bloc/chat_users_event.dart';
import 'package:skelter/presentation/chat/bloc/chat_users_state.dart';
import 'package:skelter/presentation/chat/chat_screen.dart';
import 'package:skelter/presentation/chat/domain/entities/chat_preview_entity.dart';
import 'package:skelter/presentation/chat/domain/entities/chat_user_entity.dart';
import 'package:skelter/presentation/chat/widgets/chat_shimmer.dart';
import 'package:skelter/widgets/styling/app_theme_data.dart';

import '../../flutter_test_config.dart';
import '../../test_app_cache_manager.dart';
import '../../test_helpers.dart';

class FakePathProviderPlatform extends Fake
    with MockPlatformInterfaceMixin
    implements PathProviderPlatform {
  @override
  Future<String?> getTemporaryPath() async => '/tmp/test';

  @override
  Future<String?> getApplicationSupportPath() async => '/tmp/support/test';
}

class MockChatUsersBloc extends MockBloc<ChatUsersEvent, ChatUsersState>
    implements ChatUsersBloc {}

late BaseCacheManager mockCacheManager;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() {
    mockCacheManager = MockAppImageCacheManager();
    PathProviderPlatform.instance = FakePathProviderPlatform();
  });

  testExecutable(() {
    goldenTest(
      'Chat page',
      fileName: 'chat_page',
      pumpBeforeTest: precacheImages,
      builder: () {
        final chatUsersBloc = MockChatUsersBloc();
        when(() => chatUsersBloc.state).thenReturn(_sampleLoadedState());

        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'Chat page Light Theme',
              providers: [
                BlocProvider<ChatUsersBloc>.value(value: chatUsersBloc),
              ],
              child: const ChatScreenWrapper(),
            ),
            createTestScenario(
              name: 'Chat page Dark Theme',
              providers: [
                BlocProvider<ChatUsersBloc>.value(value: chatUsersBloc),
              ],
              child: const ChatScreenWrapper(),
              theme: AppThemeEnum.DarkTheme,
            ),
            createTestScenario(
              name: 'Chat shimmer Light Theme',
              addScaffold: true,
              child: const ChatShimmer(showAnimation: false),
            ),
            createTestScenario(
              name: 'Chat shimmer Dark Theme',
              addScaffold: true,
              child: const ChatShimmer(showAnimation: false),
              theme: AppThemeEnum.DarkTheme,
            ),
          ],
        );
      },
    );
  });
}

ChatUsersState _sampleLoadedState() {
  const users = [
    ChatUserEntity(
      id: 'uid_alice',
      name: 'Alice Johnson',
      email: 'alice@test.com',
    ),
    ChatUserEntity(id: 'uid_bob', name: 'Bob Smith', email: 'bob@test.com'),
    ChatUserEntity(
      id: 'uid_admin',
      name: 'Admin Team',
      email: 'admin@test.com',
    ),
  ];
  final previews = <String, ChatPreviewEntity>{
    'uid_alice': ChatPreviewEntity(
      chatId: 'uid_alice_uid_self',
      otherUserId: 'uid_alice',
      lastMessage: 'Hey, are we still on for today?',
      lastMessageAt: DateTime(2025, 1, 1, 10),
    ),
    'uid_bob': ChatPreviewEntity(
      chatId: 'uid_bob_uid_self',
      otherUserId: 'uid_bob',
      lastMessage: 'Sure, see you there!',
      lastMessageAt: DateTime(2025, 1, 1, 9, 30),
    ),
  };
  return ChatUsersState.test(users: users, chatPreviews: previews);
}
