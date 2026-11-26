import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class SubscriptionActivatedMessage extends StatelessWidget {
  const SubscriptionActivatedMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.localization.subscription_activated_message,
      style: AppTextStyles.p3Regular.copyWith(
        color: context.currentTheme.textNeutralSecondary,
      ),
      textAlign: .center,
    );
  }
}
