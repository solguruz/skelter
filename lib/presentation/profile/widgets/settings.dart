import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/routes.gr.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.currentTheme.strokeNeutralLight200),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        leading: Icon(
          TablerIcons.settings,
          color: AppColors.currentTheme.iconNeutralDefault,
        ),
        title: Text(
          context.localization.settings,
          style: AppTextStyles.h6SemiBold,
        ),
        trailing: Icon(
          TablerIcons.chevron_right,
          color: AppColors.currentTheme.iconNeutralDefault,
        ),
        onTap: () {
          context.router.push(const SettingsRoute());
        },
      ),
    );
  }
}
