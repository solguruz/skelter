import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/routes.gr.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

class ChooseAppTheme extends StatelessWidget {
  const ChooseAppTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        TablerIcons.palette,
        color: context.currentTheme.iconNeutralDefault,
      ),
      title: Text(
        context.localization.choose_app_theme,
        style: AppTextStyles.p2Regular.copyWith(
          color: context.currentTheme.textNeutralPrimary,
        ),
      ),
      trailing: Icon(
        TablerIcons.chevron_right,
        color: context.currentTheme.iconNeutralDefault,
      ),
      onTap: () {
        context.router.push(const ChangeThemeRoute());
      },
    );
  }
}
