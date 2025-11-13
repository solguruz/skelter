import 'package:flutter/material.dart';
import 'package:skelter/presentation/chat/enum/message_type_enum.dart';
import 'package:skelter/presentation/chat/model/chat_message_model.dart';
import 'package:skelter/presentation/chat/model/chat_model.dart';
import 'package:skelter/presentation/chat/widgets/message_types.dart';
import 'package:skelter/presentation/chat/widgets/replied_to.dart';
import 'package:skelter/presentation/chat/widgets/time_ago.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class ChatConversationTile extends StatelessWidget {
  const ChatConversationTile({
    super.key,
    required this.message,
    this.repliedToMessage,
    required this.chatUser,
  });

  final ChatMessage message;
  final ChatMessage? repliedToMessage;
  final ChatModel? chatUser;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          message.isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Column(
          crossAxisAlignment: message.isSentByMe
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: message.isSentByMe
                    ? getBackgroundColor(context)
                    : context.currentTheme.bgBrandLight100,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(!message.isSentByMe ? 0 : 10),
                  bottomRight: const Radius.circular(10),
                  topLeft: const Radius.circular(10),
                  topRight: Radius.circular(message.isSentByMe ? 0 : 10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (repliedToMessage != null)
                    RepliedTo(
                      repliedToMessage: repliedToMessage,
                      chatUser: chatUser,
                    ),
                  SizedBox(height: repliedToMessage != null ? 5 : 0),
                  MessageTypes(message: message),
                  if (repliedToMessage != null) TimeAgo(message: message),
                ],
              ),
            ),
            if (repliedToMessage == null) TimeAgo(message: message),
          ],
        ),
      ),
    );
  }

  Color getBackgroundColor(BuildContext context) {
    switch (message.messageType) {
      case MessageType.text:
        return context.currentTheme.bgBrandDefault;
      case MessageType.image:
        return AppColors.redError500;
      case MessageType.audio:
        return context.currentTheme.bgBrandLight50;
    }
  }
}
