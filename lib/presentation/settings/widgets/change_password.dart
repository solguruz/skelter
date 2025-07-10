import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/app_icons/app_icon.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/utils/extensions/build_context_ext.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const AppIcon(
        iconData: TablerIcons.lock,
      ),
      title: Text(
        context.l10n.change_password,
        style: AppTextStyles.p2Regular,
      ),
      trailing: const AppIcon(
        iconData: TablerIcons.chevron_right,
      ),
      onTap: () {
        context.showSnackBar('Change Password');
      },
    );
  }
}
