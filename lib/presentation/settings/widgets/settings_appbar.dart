import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';

class SettingsAppbar extends StatelessWidget implements PreferredSizeWidget {
  const SettingsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: AppButton.icon(
        iconData: TablerIcons.arrow_left,
        size: AppButtonSize.extraLarge,
        onPressed: () => context.router.maybePop(),
      ),
      title:
          Text(context.localization.settings, style: AppTextStyles.h6SemiBold),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
