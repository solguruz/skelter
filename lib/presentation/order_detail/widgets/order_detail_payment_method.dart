import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/constants/constants.dart';
import 'package:skelter/gen/assets.gen.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class OrderDetailPaymentMethod extends StatelessWidget {
  const OrderDetailPaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          context.localization.payment_method,
          style: AppTextStyles.h6Bold.copyWith(
            color: context.currentTheme.textNeutralPrimary,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: context.currentTheme.strokeNeutralLight200,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: ListTile(
            leading: Assets.images.mastercard.image(),
            title: Text(
              paymentMethodAxis,
              style: AppTextStyles.p3Regular.copyWith(
                color: context.currentTheme.textNeutralPrimary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
