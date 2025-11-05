import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/gen/assets.gen.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';

class LoginAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LoginAppBar({
    super.key,
    this.removeLeading = true,
    this.showAppIcon = true,
    this.rightAction,
  });

  final bool removeLeading;
  final bool showAppIcon;
  final Widget? rightAction;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: removeLeading
          ? const SizedBox.shrink()
          : AppButton.icon(
              iconData: TablerIcons.arrow_left,
              iconOrTextColorOverride: context.currentTheme.iconNeutralDefault,
              size: AppButtonSize.extraLarge,
              onPressed: () {
                context.router.maybePop();
              },
            ),
      title: showAppIcon
          ? AppButton.icon(
              appIcon: context.themeAsset(
                light: Assets.icons.companyLogoLt.path,
                dark: Assets.icons.companyLogoDt.path,
              ),
              size: AppButtonSize.extraLarge,
              iconOrTextColorOverride: context.currentTheme.bgBrandDefault,
              onPressed: () {},
            )
          : null,
      actions: [if (rightAction != null) rightAction!],
      centerTitle: true,
      elevation: 0.01,
      shadowColor: context.currentTheme.strokeNeutralLight50,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
