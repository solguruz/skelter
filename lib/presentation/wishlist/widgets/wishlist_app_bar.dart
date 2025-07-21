import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class WishlistAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WishlistAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: AppColors.iconNeutralDefault,
      centerTitle: true,
      title: Text(
        context.localization.wishlist,
        style: AppTextStyles.h6SemiBold,
      ),
      leading: AppButton.icon(
        iconData: TablerIcons.arrow_left,
        size: AppButtonSize.extraLarge,
        onPressed: () {
          context.router.maybePop();
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
