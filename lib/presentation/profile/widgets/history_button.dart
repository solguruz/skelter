import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/utils/extensions/build_context_ext.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: AppColors.currentTheme.bgSurfaceBase2,
      leading: Icon(
        TablerIcons.history,
        color: AppColors.currentTheme.iconNeutralDefault,
      ),
      title: Text(
        context.localization.history,
        style: AppTextStyles.h6SemiBold.copyWith(
          color: AppColors.currentTheme.textNeutralPrimary,
        ),
      ),
      trailing: Icon(
        TablerIcons.chevron_right,
        color: AppColors.currentTheme.iconNeutralDefault,
      ),
      onTap: () {
        context.showSnackBar('Show history details');
      },
    );
  }
}
