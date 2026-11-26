import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class SubscriptionActivatedTitle extends StatelessWidget {
  const SubscriptionActivatedTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.localization.subscription_activated_title,
      style: AppTextStyles.h4SemiBold.copyWith(
        color: context.currentTheme.textNeutralPrimary,
      ),
      textAlign: .center,
    );
  }
}
