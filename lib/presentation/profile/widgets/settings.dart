import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/routes.gr.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: context.currentTheme.strokeNeutralLight200),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
        tileColor: context.currentTheme.bgSurfaceBase2,
        leading: Icon(
          TablerIcons.settings,
          color: context.currentTheme.iconNeutralDefault,
        ),
        title: Text(
          context.localization.settings,
          style: AppTextStyles.h6SemiBold.copyWith(
            color: context.currentTheme.textNeutralPrimary,
          ),
        ),
        trailing: Icon(
          TablerIcons.chevron_right,
          color: context.currentTheme.iconNeutralDefault,
        ),
        onTap: () {
          context.router.push(const SettingsRoute());
        },
      ),
    );
  }
}
