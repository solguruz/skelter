import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class TotalAmount extends StatelessWidget {
  const TotalAmount({
    super.key,
    required this.finalAmount,
  });

  final String finalAmount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.total_amount,
          style:
              AppTextStyles.p4Regular.withColor(AppColors.textNeutralSecondary),
        ),
        const SizedBox(height: 6),
        Text(
          '\$$finalAmount',
          style: AppTextStyles.h6Bold.withColor(AppColors.textNeutralPrimary),
        ),
      ],
    );
  }
}
