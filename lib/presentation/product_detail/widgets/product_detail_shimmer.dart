import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';
import 'package:skelter/widgets/shimmer/shimmer_button.dart';
import 'package:skelter/widgets/shimmer/shimmer_content.dart';
import 'package:skelter/widgets/shimmer/shimmer_image.dart';

class ProductDetailShimmer extends StatelessWidget {
  const ProductDetailShimmer({
    super.key,
    this.showAnimation = true,
  });

  final bool showAnimation;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.currentTheme.bgNeutralLight100,
      highlightColor: context.currentTheme.bgNeutralLight50,
      enabled: showAnimation,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            const SizedBox(height: 60),
            ShimmerImage(
              height: MediaQuery.of(context).size.height * 0.28,
              width: double.infinity,
            ),
            const SizedBox(height: 20),
            const ShimmerContent(
              height: 69,
              width: double.infinity,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShimmerButton(
                  height: 56,
                  width: MediaQuery.of(context).size.width * 0.42,
                  radius: 10,
                ),
                const SizedBox(width: 16),
                ShimmerButton(
                  height: 56,
                  width: MediaQuery.of(context).size.width * 0.42,
                  radius: 10,
                ),
              ],
            ),
            const SizedBox(height: 20),
            const ShimmerContent(
              width: double.infinity,
              height: 24,
              radius: 4,
            ),
            const SizedBox(height: 10),
            Container(
              height: 100,
              padding: const EdgeInsetsGeometry.symmetric(horizontal: 10),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (_, __) => const ShimmerImage(
                  width: 100,
                  height: 100,
                  radius: 12,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const ShimmerContent(
              height: 120,
              width: double.infinity,
            ),
            const SizedBox(height: 10),
            ShimmerButton(
              height: 56,
              width: MediaQuery.of(context).size.width * 0.60,
              radius: 12,
            ),
          ],
        ),
      ),
    );
  }
}
