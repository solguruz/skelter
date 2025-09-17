import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/chat/data/chat_conversation_sample_data.dart';
import 'package:skelter/presentation/chat/model/chat_message_model.dart';
import 'package:skelter/presentation/chat/model/chat_model.dart';
import 'package:skelter/presentation/chat/widgets/chat_conversation_tile.dart';
import 'package:skelter/presentation/chat/widgets/date_separator_text.dart';
import 'package:skelter/utils/extensions/date_time_extensions.dart';

class ChatMessageList extends StatefulWidget {
  const ChatMessageList({super.key, required this.chatUser});

  final ChatModel chatUser;

  @override
  State<ChatMessageList> createState() => _ChatMessageListState();
}

class _ChatMessageListState extends State<ChatMessageList>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.05),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: ListView.builder(
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
                  chatUser: widget.chatUser,
                ),
              ],
            );
          },
        ),
      ),
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
