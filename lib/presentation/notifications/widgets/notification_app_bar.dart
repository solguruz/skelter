import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/theme/extention/theme_extension.dart';

class NotificationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const NotificationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.currentTheme.bgSurfaceBase,
      title: Text(
        context.localization.notifications,
        style: AppTextStyles.h6SemiBold
            .copyWith(color: context.currentTheme.textNeutralPrimary),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          context.maybePop();
        },
        icon: Icon(
          Icons.adaptive.arrow_back,
          color: context.currentTheme.iconNeutralDefault,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(54);
}
