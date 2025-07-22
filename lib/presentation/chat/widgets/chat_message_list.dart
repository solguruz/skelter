import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/chat/data/chat_conversation_sample_data.dart';
import 'package:flutter_skeleton/presentation/chat/model/chat_message_model.dart';
import 'package:flutter_skeleton/presentation/chat/model/chat_model.dart';
import 'package:flutter_skeleton/presentation/chat/widgets/chat_conversation_tile.dart';
import 'package:flutter_skeleton/presentation/chat/widgets/date_separator_text.dart';
import 'package:flutter_skeleton/utils/extensions/date_time_extensions.dart';

class ChatMessageList extends StatelessWidget {
  const ChatMessageList({super.key, required this.chatUser});

  final ChatModel chatUser;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        final bool showDateSeparator = index == messages.length - 1 ||
            messages[index + 1].date.day != message.date.day;
        ChatMessage? repliedToMessage;
        final repliedToMessageId = message.replyingToId;
        if (repliedToMessageId != null) {
          repliedToMessage = messages.firstWhereOrNull(
            (msg) => msg.id == repliedToMessageId,
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (showDateSeparator)
              DateSeparatorText(
                date: _formatDate(context, message.date),
              ),
            ChatConversationTile(
              message: message,
              repliedToMessage: repliedToMessage,
              chatUser: chatUser,
            ),
          ],
        );
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
