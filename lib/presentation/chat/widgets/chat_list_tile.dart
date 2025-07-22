import 'package:flutter/material.dart';
import 'package:flutter_skeleton/presentation/chat/model/chat_model.dart';
import 'package:flutter_skeleton/presentation/chat/widgets/chat_content_preview.dart';
import 'package:flutter_skeleton/presentation/chat/widgets/message_details.dart';
import 'package:flutter_skeleton/presentation/chat/widgets/user_avatar.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile({
    super.key,
    required this.chatModel,
  });

  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserAvatar(chatModel: chatModel),
        const SizedBox(width: 16.0),
        ChatContentPreview(chatModel: chatModel),
        const SizedBox(width: 16.0),
        MessageDetails(chatModel: chatModel),
      ],
    );
  }
}
