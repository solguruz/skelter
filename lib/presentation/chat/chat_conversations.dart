import 'package:auto_route/annotations.dart';
import 'package:clarity_flutter/clarity_flutter.dart';
import 'package:flutter/material.dart';
import 'package:skelter/presentation/chat/model/chat_model.dart';
import 'package:skelter/presentation/chat/widgets/chat_conversation_app_bar.dart';
import 'package:skelter/presentation/chat/widgets/chat_message_list.dart';
import 'package:skelter/presentation/chat/widgets/new_message_text_field.dart';

@RoutePage()
class ChatConversationScreen extends StatelessWidget {
  const ChatConversationScreen({super.key, required this.chatUser});

  final ChatModel chatUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatConversationAppBar(chatUser: chatUser),
      body: SafeArea(
        child: ClarityMask(
          child: Column(
            children: [
              Expanded(child: ChatMessageList(chatUser: chatUser)),
              const Divider(),
              const NewMessageTextField(),
            ],
          ),
        ),
      ),
    );
  }
}
