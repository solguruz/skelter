import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/presentation/chat/model/chat_model.dart';
import 'package:skelter/presentation/chat/widgets/user_avatar.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';

class ChatConversationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ChatConversationAppBar({super.key, required this.chatUser});

  final ChatModel chatUser;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: AppButton.icon(
        iconData: TablerIcons.arrow_left,
        iconOrTextColorOverride: context.currentTheme.iconNeutralDefault,
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
                Text(
                  chatUser.name,
                  style: AppTextStyles.p3SemiBold.copyWith(
                    color: context.currentTheme.textNeutralPrimary,
                  ),
                ),
                Text(
                  'Last seen 04:00 pm',
                  style: AppTextStyles.p4Medium.copyWith(
                    color: context.currentTheme.textNeutralSecondary,
                  ),
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
