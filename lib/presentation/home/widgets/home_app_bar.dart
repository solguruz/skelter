import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/gen/assets.gen.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/routes.gr.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(14),
        child: Image.asset(Assets.icons.icon.path),
      ),
      title: Text(
        context.localization.home,
        style: AppTextStyles.h6SemiBold,
      ),
      actions: [
        AppButton.icon(
          onPressed: () => context.pushRoute(const NotificationsRoute()),
          size: AppButtonSize.extraLarge,
          iconData: TablerIcons.bell,
        ),
        AppButton.icon(
          iconData: TablerIcons.message,
          size: AppButtonSize.extraLarge,
          onPressed: () => context.pushRoute(const ChatRoute()),
        ),
        AppButton.icon(
          iconData: TablerIcons.info_circle,
          size: AppButtonSize.extraLarge,
          onPressed: () => context.pushRoute(const EmptyViewsRoute()),
        ),
      ],
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
