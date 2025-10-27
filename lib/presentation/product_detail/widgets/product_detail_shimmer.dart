import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class ProductDetailShimmer extends StatelessWidget {
  const ProductDetailShimmer({
    super.key,
    this.showAnimation = true,
  });

  final bool showAnimation;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.neutral100,
      highlightColor: AppColors.neutral50,
      enabled: showAnimation,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image placeholder
            Container(
              height: 280,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 20),

            // Title shimmer
            Container(
              height: 20,
              width: 180,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 12),

            // Price shimmer
            Container(
              height: 16,
              width: 120,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 20),

            // Buttons shimmer (Add to cart, Mark favorite)
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Product Photos shimmer
            Container(
              height: 16,
              width: 140,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 16),

            SizedBox(
              height: 80,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (_, __) => Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Product description line shimmer
            Container(
              height: 16,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 16,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 32),

            // View Product Reviews button shimmer
            Container(
              height: 48,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
