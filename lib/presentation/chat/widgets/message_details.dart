import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/presentation/chat/model/chat_model.dart';
import 'package:flutter_skeleton/utils/extensions/date_time_extensions.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class MessageDetails extends StatelessWidget {
  const MessageDetails({
    super.key,
    required this.chatModel,
  });

  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    final int unreadMessageCount = chatModel.unreadMessageCount ?? 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (chatModel.lastMessageTime != null)
          Text(
            chatModel.lastMessageTime!.timeAgo,
            style: AppTextStyles.p3Regular,
          ),
        const SizedBox(height: 12.0),
        if (unreadMessageCount > 0)
          Container(
            decoration: const BoxDecoration(
              color: AppColors.bgBrandHover,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(8),
                right: Radius.circular(8),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 2,
            ),
            child: Text(
              min(unreadMessageCount, 999).toString() +
                  (unreadMessageCount > 999 ? '+' : ''),
              style: AppTextStyles.c2SemiBold.withColor(AppColors.white),
            ),
          ),
      ],
    );
  }
}
