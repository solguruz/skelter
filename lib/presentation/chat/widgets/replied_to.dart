import 'package:flutter/material.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/chat/model/chat_message_model.dart';
import 'package:skelter/presentation/chat/model/chat_model.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class RepliedTo extends StatelessWidget {
  const RepliedTo({
    super.key,
    required this.repliedToMessage,
    required this.chatUser,
  });

  final ChatMessage? repliedToMessage;
  final ChatModel? chatUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: 5,
                height: 55,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  repliedToMessage?.isSentByMe ?? false
                      ? context.localization.you
                      : '${chatUser?.name}',
                  style: AppTextStyles.p4Medium.withColor(AppColors.brand500),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  repliedToMessage?.message ?? '',
                  style:
                      AppTextStyles.p3Regular.withColor(AppColors.neutral900),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
