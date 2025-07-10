import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/app_icons/app_icon.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/utils/extensions/build_context_ext.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class ChooseAppTheme extends StatelessWidget {
  const ChooseAppTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const AppIcon(
        iconData: TablerIcons.palette,
      ),
      title: Text(
        context.l10n.choose_app_theme,
        style: AppTextStyles.p2Regular,
      ),
      trailing: const AppIcon(
        iconData: TablerIcons.chevron_right,
      ),
      onTap: () {
        context.showSnackBar('Choose app theme');
      },
    );
  }
}
