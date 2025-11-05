import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';
import 'package:skelter/widgets/app_button/app_button.dart';

class PaymentMethodHeader extends StatelessWidget {
  const PaymentMethodHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          context.localization.select_payment_method,
          style: AppTextStyles.p2SemiBold
              .copyWith(color: context.currentTheme.textNeutralPrimary),
        ),
        const Spacer(),
        AppButton.icon(
          iconData: TablerIcons.arrow_right,
          iconOrTextColorOverride: context.currentTheme.iconBrandPressed,
          onPressed: () {},
        ),
      ],
    );
  }
}
