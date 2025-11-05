import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({
    super.key,
    this.showAnimation = true,
    this.itemCount = 6,
  });

  final bool showAnimation;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 6, bottom: 16),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 191,
        mainAxisExtent: 271,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: context.currentTheme.bgNeutralLight100,
          highlightColor: context.currentTheme.bgNeutralLight50,
          enabled: showAnimation,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      },
    );
  }
}
