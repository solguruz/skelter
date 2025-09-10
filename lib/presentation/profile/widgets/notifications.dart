import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/utils/extensions/build_context_ext.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        TablerIcons.bell,
        color: AppColors.iconNeutralDefault,
      ),
      title: Text(
        context.localization.notifications,
        style: AppTextStyles.h6SemiBold,
      ),
      trailing: const Icon(
        TablerIcons.chevron_right,
        color: AppColors.iconNeutralDefault,
      ),
      onTap: () {
        context.showSnackBar('Show Notification details');
      },
    );
  }
}
