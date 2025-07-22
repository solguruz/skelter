import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class PaymentMethodHeader extends StatelessWidget {
  const PaymentMethodHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          context.localization.select_payment_method,
          style: AppTextStyles.p2SemiBold,
        ),
        const Spacer(),
        AppButton.icon(
          iconData: TablerIcons.arrow_right,
          iconOrTextColorOverride: AppColors.iconBrandPressed,
          onPressed: () {},
        ),
      ],
    );
  }
}
