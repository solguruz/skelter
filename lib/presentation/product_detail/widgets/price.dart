import 'package:flutter/material.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class Price extends StatelessWidget {
  final double price;

  const Price({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: '\$${price.toStringAsFixed(2)} ',
        style: AppTextStyles.p3SemiBold.copyWith(
          color: AppColors.textBrandPrimary,
        ),
        children: <InlineSpan>[
          TextSpan(
            text: context.localization.inclusive_of_taxes,
            style: AppTextStyles.p3Medium.copyWith(
              color: AppColors.textNeutralSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
