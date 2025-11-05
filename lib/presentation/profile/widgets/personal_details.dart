import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/utils/extensions/build_context_ext.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
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
            TablerIcons.user_circle,
            color: context.currentTheme.iconNeutralDefault,
          ),
          title: Text(
            context.localization.personal_details,
            style: AppTextStyles.h6SemiBold.copyWith(
              color: context.currentTheme.textNeutralPrimary,
            ),
          ),
          trailing: Icon(
            TablerIcons.chevron_right,
            color: context.currentTheme.iconNeutralDefault,
          ),
          onTap: () {
            context.showSnackBar('Show account details');
          },
        ),
      ],
    );
  }
}
