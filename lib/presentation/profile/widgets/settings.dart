import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/routes.gr.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.strokeNeutralLight200),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        leading: const Icon(
          TablerIcons.settings,
          color: AppColors.iconNeutralDefault,
        ),
        title: Text(
          context.localization.settings,
          style: AppTextStyles.h6SemiBold,
        ),
        trailing: const Icon(
          TablerIcons.chevron_right,
          color: AppColors.iconNeutralDefault,
        ),
        onTap: () {
          context.router.push(const SettingsRoute());
        },
      ),
    );
  }
}
