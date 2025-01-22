import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/app_icons/app_icon.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/core/app_sizes.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/utils/extensions/build_context_ext.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.strokeNeutralLight200),
        borderRadius: BorderRadius.circular(AppRadius.M),
      ),
      child: ListTile(
        leading: const AppIcon(
          iconData: TablerIcons.settings,
        ),
        title: Text(
          context.l10n.settings,
          style: AppTextStyles.h6SemiBold,
        ),
        trailing: const AppIcon(
          iconData: TablerIcons.chevron_right,
        ),
        onTap: () {
          context.showSnackBar('Show settings');
        },
      ),
    );
  }
}
