import 'package:flutter/material.dart';
import 'package:flutter_skeleton/core/app_sizes.dart';
import 'package:flutter_skeleton/widgets/shimmer/shimmer_circular_image.dart';
import 'package:flutter_skeleton/widgets/shimmer/shimmer_text.dart';
import 'package:shimmer/shimmer.dart';

class ChatShimmer extends StatelessWidget {
  const ChatShimmer({super.key, this.showAnimation = true});

  final bool showAnimation;

  @override
  Widget build(BuildContext context) {
    const double profileImageSize = 14.0;
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: showAnimation,
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ShimmerCircularImage(size: profileImageSize),
          SizedBox(width: AppSize.L),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ShimmerText(width: 60),
                SizedBox(height: AppSize.XS),
                ShimmerText(width: double.infinity),
              ],
            ),
          ),
          SizedBox(width: AppSize.XXL),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ShimmerText(width: 50),
              SizedBox(height: AppSize.M),
              ShimmerText(width: 30, radius: 8),
            ],
          ),
        ],
      ),
    );
  }
}
