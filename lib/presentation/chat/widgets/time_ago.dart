import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/presentation/chat/model/chat_message_model.dart';
import 'package:flutter_skeleton/utils/extensions/date_time_extensions.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class TimeAgo extends StatelessWidget {
  const TimeAgo({
    super.key,
    required this.message,
  });

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Text(
          '${message.date.to12HourFormat}${message.isSentByMe ? ' '
              '• ${message.status}' : ''}',
          style: AppTextStyles.c2Medium.withColor(AppColors.neutral500),
        ),
      ],
    );
  }
}
