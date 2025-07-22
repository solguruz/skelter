import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/presentation/chat/model/chat_model.dart';
import 'package:flutter_skeleton/presentation/chat/widgets/user_avatar.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class ChatConversationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ChatConversationAppBar({super.key, required this.chatUser});

  final ChatModel chatUser;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: AppButton.icon(
        iconData: TablerIcons.arrow_left,
        size: AppButtonSize.extraLarge,
        onPressed: () {
          context.router.maybePop();
        },
      ),
      title: Row(
        children: [
          ChatAvatarSmall(chatModel: chatUser),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(chatUser.name, style: AppTextStyles.p3SemiBold),
                Text(
                  'Last seen 04:00 pm',
                  style: AppTextStyles.p4Medium
                      .withColor(AppColors.textNeutralSecondary),
                ),
              ],
            ),
          ),
        ],
      ),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
