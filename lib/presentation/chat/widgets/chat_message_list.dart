import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/chat/bloc/chat_conversation_bloc.dart';
import 'package:skelter/presentation/chat/bloc/chat_conversation_state.dart';
import 'package:skelter/presentation/chat/model/chat_message_model.dart';
import 'package:skelter/presentation/chat/model/chat_model.dart';
import 'package:skelter/presentation/chat/widgets/chat_conversation_tile.dart';
import 'package:skelter/presentation/chat/widgets/date_separator_text.dart';
import 'package:skelter/utils/extensions/date_time_extensions.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class ChatMessageList extends StatelessWidget {
  const ChatMessageList({super.key, required this.chatUser});

  final ChatModel chatUser;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatConversationBloc, ChatConversationState>(
      buildWhen: (previous, current) =>
          previous.status != current.status ||
          previous.messages != current.messages,
      builder: (context, state) {
        switch (state.status) {
          case ChatConversationStatus.initial:
          case ChatConversationStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case ChatConversationStatus.failure:
            return Center(
              child: Text(
                state.errorMessage ?? context.localization.failed_to_load_chats,
                style: AppTextStyles.p3Regular.copyWith(
                  color: context.currentTheme.textNeutralSecondary,
                ),
                textAlign: .center,
              ),
            );
          case ChatConversationStatus.loaded:
            if (state.messages.isEmpty) {
              return Center(
                child: Text(
                  context.localization.no_messages_yet,
                  style: AppTextStyles.p3Regular.copyWith(
                    color: context.currentTheme.textNeutralSecondary,
                  ),
                ),
              );
            }
            final currentUserId = context
                .read<ChatConversationBloc>()
                .currentUserId;
            return ListView.builder(
              reverse: true,
              itemCount: state.messages.length,
              itemBuilder: (context, index) {
                final entity = state.messages[index];
                final bool showDateSeparator =
                    index == state.messages.length - 1 ||
                    state.messages[index + 1].createdAt.day !=
                        entity.createdAt.day;
                final presentation = ChatMessage(
                  id: entity.id,
                  message: entity.text,
                  status: '',
                  isSentByMe: entity.senderId == currentUserId,
                  date: entity.createdAt,
                  messageType: .text,
                );
                return Column(
                  crossAxisAlignment: .stretch,
                  children: [
                    if (showDateSeparator)
                      DateSeparatorText(
                        date: _formatDate(context, entity.createdAt),
                      ),
                    ChatConversationTile(
                      message: presentation,
                      chatUser: chatUser,
                    ),
                  ],
                );
              },
            );
        }
      },
    );
  }

  String _formatDate(BuildContext context, DateTime date) {
    final compareToDate = getCurrentDateTime();
    if (date.year == compareToDate.year &&
        date.month == compareToDate.month &&
        date.day == compareToDate.day) {
      return context.localization.today;
    } else if (date.year == compareToDate.year &&
        date.month == compareToDate.month &&
        date.day == compareToDate.day - 1) {
      return context.localization.yesterday;
    } else {
      return '${date.month}/${date.day}/${date.year}';
    }
  }
}
