import 'package:flutter/material.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class ProductPhotosTitle extends StatelessWidget {
  const ProductPhotosTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.localization.product_photos,
          style: AppTextStyles.p2SemiBold
              .copyWith(color: AppColors.textNeutralPrimary),
        ),
      ],
    );
  }
}
