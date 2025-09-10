import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class NotificationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const NotificationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        context.localization.notifications,
        style: AppTextStyles.h6SemiBold,
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          context.maybePop();
        },
        icon: Icon(
          Icons.adaptive.arrow_back,
          color: AppColors.iconNeutralDefault,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(54);
}
