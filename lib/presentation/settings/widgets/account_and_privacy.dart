// ignore_for_file: directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/utils/extensions/build_context_ext.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

class AccountAndPrivacy extends StatelessWidget {
  const AccountAndPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      leading: Icon(
        TablerIcons.user_circle,
        color: context.currentTheme.iconNeutralDefault,
      ),
      title: Text(
        context.localization.account_and_privacy,
        style: AppTextStyles.p2Regular.copyWith(
          color: context.currentTheme.textNeutralPrimary,
        ),
      ),
      trailing: Icon(
        TablerIcons.chevron_right,
        color: context.currentTheme.iconNeutralDefault,
      ),
      onTap: () {
        context.showSnackBar('Account and Privacy');
      },
    );
  }
}
