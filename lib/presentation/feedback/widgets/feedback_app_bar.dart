import 'package:auto_route/auto_route.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';

class FeedbackAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FeedbackAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: AppButton.icon(
        iconData: TablerIcons.arrow_left,
        size: AppButtonSize.extraLarge,
        iconOrTextColorOverride: context.currentTheme.iconNeutralDefault,
        onPressed: () => context.router.maybePop(),
      ),
      title: Text(
        context.localization.feedback,
        style: AppTextStyles.h6SemiBold.copyWith(
          color: context.currentTheme.textNeutralPrimary,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
