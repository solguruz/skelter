import 'package:material_ui/material_ui.dart';
import 'package:skelter/presentation/chat/model/chat_message_model.dart';
import 'package:skelter/presentation/chat/model/chat_model.dart';
import 'package:skelter/presentation/chat/widgets/message_types.dart';
import 'package:skelter/presentation/chat/widgets/time_ago.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class ChatConversationTile extends StatelessWidget {
  const ChatConversationTile({
    super.key,
    required this.message,
    required this.chatUser,
  });

  final ChatMessage message;
  final ChatModel? chatUser;

  @override
  Widget build(BuildContext context) {
    final isSentByMe = message.isSentByMe;
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
        child: Column(
          crossAxisAlignment: isSentByMe ? .end : .start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isSentByMe
                    ? context.currentTheme.bgBrandDefault
                    : context.currentTheme.bgBrandLight50,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16),
                  topRight: Radius.circular(isSentByMe ? 0 : 16),
                  bottomLeft: Radius.circular(isSentByMe ? 16 : 0),
                  bottomRight: const Radius.circular(16),
                ),
              ),
              child: MessageTypes(message: message),
            ),
            TimeAgo(message: message),
          ],
        ),
      ),
    );
  }
}
