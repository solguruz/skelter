import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';

class SubscriptionRenewText extends StatelessWidget {
  const SubscriptionRenewText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.localization.subscription_renew,
      style: AppTextStyles.p3Regular,
    );
  }
}
