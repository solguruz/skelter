import 'package:auto_route/auto_route.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/routes.gr.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class FeedbackAndRating extends StatelessWidget {
  const FeedbackAndRating({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      tileColor: context.currentTheme.bgSurfaceBase2,
      leading: Icon(
        TablerIcons.star,
        color: context.currentTheme.iconNeutralDefault,
      ),
      title: Text(
        context.localization.feedback_and_ratings,
        style: AppTextStyles.h6SemiBold.copyWith(
          color: context.currentTheme.textNeutralPrimary,
        ),
      ),
      trailing: Icon(
        TablerIcons.chevron_right,
        color: context.currentTheme.iconNeutralDefault,
      ),
      onTap: () {
        context.router.push(const FeedbackRoute());
      },
    );
  }
}
