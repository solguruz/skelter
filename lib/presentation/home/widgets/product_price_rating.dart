import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/presentation/home/domain/entities/product.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class ProductPriceRating extends StatelessWidget {
  final Product product;

  const ProductPriceRating({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            '\$${product.price.toStringAsFixed(2)}',
            maxLines: 1,
            style: AppTextStyles.p3SemiBold.withColor(
              AppColors.textBrandPrimary,
            ),
          ),
        ),
        const Icon(
          Icons.star,
          color: AppColors.bgWarningHover,
          size: 16,
        ),
        const SizedBox(width: 4),
        Text(
          product.rating.toString(),
          style: AppTextStyles.p4Medium.withColor(
            AppColors.textNeutralSecondary,
          ),
        ),
      ],
    );
  }
}
