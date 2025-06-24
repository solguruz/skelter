import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/routes.gr.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(context.l10n.home),
      actions: [
        AppButton.icon(
          iconData: TablerIcons.message,
          size: AppButtonSize.xl,
          onPressed: () => context.pushRoute(const ChatRoute()),
        ),
        AppButton.icon(
          iconData: TablerIcons.info_circle,
          size: AppButtonSize.xl,
          onPressed: () => context.pushRoute(const EmptyViewsRoute()),
        ),
      ],
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
