import 'package:auto_route/auto_route.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/routes.gr.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class UpgradeToPro extends StatelessWidget {
  const UpgradeToPro({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          tileColor: context.currentTheme.bgSurfaceBase2,
          leading: Icon(
            TablerIcons.crown,
            color: context.currentTheme.iconNeutralDefault,
          ),
          title: Text(
            context.localization.upgrade_to_pro,
            style: AppTextStyles.h6SemiBold.copyWith(
              color: context.currentTheme.textNeutralPrimary,
            ),
          ),
          trailing: Icon(
            TablerIcons.chevron_right,
            color: context.currentTheme.iconNeutralDefault,
          ),
          onTap: () => context.pushRoute(const SubscriptionRoute()),
        ),
      ],
    );
  }
}
