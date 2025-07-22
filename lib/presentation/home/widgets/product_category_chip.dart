import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class ProductCategoryChip extends StatelessWidget {
  final String category;

  const ProductCategoryChip({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.bgBrandLight50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        category,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.c1SemiBold.withColor(
          AppColors.textBrandSecondary,
        ),
      ),
    );
  }
}
