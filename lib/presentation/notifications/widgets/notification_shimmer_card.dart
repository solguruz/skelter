import 'package:flutter/material.dart';
import 'package:flutter_skeleton/core/app_sizes.dart';
import 'package:flutter_skeleton/utils/extensions/build_context_ext.dart';
import 'package:flutter_skeleton/widgets/shimmer/shimmer_text.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class NotificationShimmerCard extends StatelessWidget {
  const NotificationShimmerCard({
    super.key,
    required this.showAnimation,
  });

  final bool showAnimation;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      enabled: showAnimation,
      highlightColor: Colors.grey.shade100,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.L,
          vertical: AppSize.S,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundColor: AppColors.white,
              radius: AppSize.L,
            ),
            const SizedBox(
              width: AppSize.M,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerText(width: context.screenWidth * 0.3),
                  const SizedBox(
                    height: AppSize.XS,
                  ),
                  const ShimmerText(width: double.infinity),
                  const SizedBox(
                    height: AppSize.XS,
                  ),
                  ShimmerText(width: context.screenWidth * 0.2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
