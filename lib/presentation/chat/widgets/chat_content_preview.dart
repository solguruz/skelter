import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/presentation/chat/model/chat_model.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class ChatContentPreview extends StatelessWidget {
  const ChatContentPreview({super.key, required this.chatModel});

  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: .start,
        mainAxisSize: .min,
        children: [
          Text(
            chatModel.name,
            style: AppTextStyles.p2Medium.copyWith(
              color: context.currentTheme.textNeutralPrimary,
            ),
            overflow: .ellipsis,
            maxLines: 1,
          ),
          if (chatModel.lastMessage.isNotEmpty) ...[
            const SizedBox(height: 4.0),
            Text(
              chatModel.lastMessage,
              style: AppTextStyles.p3Regular.copyWith(
                color: context.currentTheme.textNeutralSecondary,
              ),
              overflow: .ellipsis,
              maxLines: 1,
            ),
          ],
        ],
      ),
    );
  }
}
