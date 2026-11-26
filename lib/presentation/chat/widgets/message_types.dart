import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/presentation/chat/model/chat_message_model.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class MessageTypes extends StatelessWidget {
  const MessageTypes({super.key, required this.message});

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Text(
      message.message,
      style: AppTextStyles.p2Regular.copyWith(
        color: message.isSentByMe
            ? context.currentTheme.strokeShadesWhite
            : context.currentTheme.textNeutralPrimary,
      ),
    );
  }
}
