import 'package:flutter/material.dart';
import 'package:flutter_skeleton/gen/assets.gen.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class LoginAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LoginAppBar({
    super.key,
    this.removeLeading = false,
    this.showAppcon = true,
    this.rightAction,
  });

  final bool removeLeading;
  final bool showAppcon;
  final Widget? rightAction;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: removeLeading ? const SizedBox.shrink() : null,
      title: showAppcon
          ? AppButton.icon(
              appIcon: Assets.icons.icon.path,
              size: AppButtonSize.extraLarge,
              iconOrTextColorOverride: AppColors.bgBrandDefault,
              onPressed: () {},
            )
          : null,
      actions: [if (rightAction != null) rightAction!],
      centerTitle: true,
      elevation: 0.01,
      shadowColor: AppColors.strokeNeutralLight50,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
