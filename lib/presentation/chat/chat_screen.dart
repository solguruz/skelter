import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/core/services/injection_container.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/chat/bloc/chat_users_bloc.dart';
import 'package:skelter/presentation/chat/bloc/chat_users_event.dart';
import 'package:skelter/presentation/chat/bloc/chat_users_state.dart';
import 'package:skelter/presentation/chat/domain/entities/chat_preview_entity.dart';
import 'package:skelter/presentation/chat/domain/entities/chat_user_entity.dart';
import 'package:skelter/presentation/chat/domain/usecases/watch_my_chats.dart';
import 'package:skelter/presentation/chat/domain/usecases/watch_other_users.dart';
import 'package:skelter/presentation/chat/model/chat_model.dart';
import 'package:skelter/presentation/chat/widgets/chat_list_app_bar.dart';
import 'package:skelter/presentation/chat/widgets/chat_list_tile.dart';
import 'package:skelter/presentation/chat/widgets/chat_shimmer.dart';
import 'package:skelter/presentation/chat/widgets/chat_users_search_bar.dart';
import 'package:skelter/presentation/chat/widgets/empty_chat_view.dart';
import 'package:skelter/routes.gr.dart';
import 'package:skelter/services/firebase_auth_services.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

@RoutePage()
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUserId = sl<FirebaseAuthService>().getCurrentUser()?.uid ?? '';
    return BlocProvider<ChatUsersBloc>(
      create: (_) => ChatUsersBloc(
        watchOtherUsers: sl<WatchOtherUsers>(),
        watchMyChats: sl<WatchMyChats>(),
        currentUserId: currentUserId,
      )..add(const ChatUsersSubscribedEvent()),
      child: const ChatScreenWrapper(),
    );
  }
}

class ChatScreenWrapper extends StatelessWidget {
  const ChatScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ChatListAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              ChatUsersSearchBar(),
              SizedBox(height: 24.0),
              Expanded(child: _ChatUsersView()),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChatUsersView extends StatelessWidget {
  const _ChatUsersView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatUsersBloc, ChatUsersState>(
      builder: (context, state) {
        switch (state.status) {
          case ChatUsersStatus.initial:
          case ChatUsersStatus.loading:
            return const _ChatUsersShimmer();
          case ChatUsersStatus.failure:
            return Center(
              child: Text(
                state.errorMessage ?? context.localization.failed_to_load_chats,
                style: AppTextStyles.p3Regular.copyWith(
                  color: context.currentTheme.textNeutralSecondary,
                ),
                textAlign: .center,
              ),
            );
          case ChatUsersStatus.loaded:
            if (state.users.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    context.localization.no_users_to_chat_with,
                    style: AppTextStyles.p1SemiBold,
                    textAlign: .center,
                  ),
                ),
              );
            }
            final visibleUsers = state.filteredUsers;
            if (visibleUsers.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    context.localization.no_users_match_search,
                    style: AppTextStyles.p3Regular.copyWith(
                      color: context.currentTheme.textNeutralSecondary,
                    ),
                    textAlign: .center,
                  ),
                ),
              );
            }
            return ListView.builder(
              itemCount: visibleUsers.length,
              itemBuilder: (context, index) {
                final user = visibleUsers[index];
                final preview = state.chatPreviews[user.id];
                final model = _toChatModel(user, preview);
                return InkWell(
                  onTap: () {
                    context.router.push(ChatConversationRoute(chatUser: model));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ChatListTile(chatModel: model),
                  ),
                );
              },
            );
        }
      },
    );
  }

  ChatModel _toChatModel(ChatUserEntity user, ChatPreviewEntity? preview) {
    return ChatModel(
      name: user.name,
      profilePicture: user.photoUrl ?? '',
      lastMessage: preview?.lastMessage ?? '',
      lastMessageTime: preview?.lastMessageAt,
      isOnline: false,
      userId: user.id,
    );
  }
}

class _ChatUsersShimmer extends StatelessWidget {
  const _ChatUsersShimmer();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: ChatShimmer(),
        );
      },
    );
  }
}

/// Kept for compatibility with callers that previously imported this widget.
class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) => const EmptyChatView();
}

/// Kept for compatibility with callers that previously imported this widget.
class ShimmerLoadingView extends StatelessWidget {
  const ShimmerLoadingView({super.key});

  @override
  Widget build(BuildContext context) => const _ChatUsersShimmer();
}
