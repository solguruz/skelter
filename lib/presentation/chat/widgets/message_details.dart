import 'dart:math';

import 'package:flutter/material.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/chat/model/chat_model.dart';
import 'package:skelter/utils/extensions/date_time_extensions.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

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
            chatModel.lastMessageTime!.timeAgo(context.localization),
            style: AppTextStyles.p3Regular
                .copyWith(color: context.currentTheme.textNeutralSecondary),
          ),
        const SizedBox(height: 12.0),
        if (unreadMessageCount > 0)
          Container(
            decoration: BoxDecoration(
              color: context.currentTheme.bgBrandDefault,
              borderRadius: const BorderRadius.horizontal(
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
              style: AppTextStyles.c2SemiBold
                  .copyWith(color: context.currentTheme.strokeShadesWhite),
            ),
          ),
      ],
    );
  }
}
