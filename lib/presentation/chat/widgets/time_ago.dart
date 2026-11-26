import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/presentation/chat/model/chat_message_model.dart';
import 'package:skelter/utils/extensions/date_time_extensions.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class TimeAgo extends StatelessWidget {
  const TimeAgo({super.key, required this.message});

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    final time = message.date.to12HourFormat();
    final showStatusSuffix =
        message.isSentByMe && message.status.trim().isNotEmpty;
    return Column(
      children: [
        const SizedBox(height: 5),
        Text(
          showStatusSuffix ? '$time • ${message.status}' : time,
          style: AppTextStyles.c2Medium.copyWith(
            color: context.currentTheme.textNeutralSecondary,
          ),
        ),
      ],
    );
  }
}
