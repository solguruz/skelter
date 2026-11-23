import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';

class PaymentProcessingMessage extends StatelessWidget {
  const PaymentProcessingMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.localization.payment_processing_message,
      style: AppTextStyles.p2Medium,
      textAlign: .center,
    );
  }
}
