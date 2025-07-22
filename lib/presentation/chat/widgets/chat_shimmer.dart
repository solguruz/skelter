import 'package:flutter/material.dart';
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
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ShimmerText(width: 60),
                SizedBox(height: 4.0),
                ShimmerText(width: double.infinity),
              ],
            ),
          ),
          SizedBox(width: 32.0),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ShimmerText(width: 50),
              SizedBox(height: 12.0),
              ShimmerText(width: 30, radius: 8),
            ],
          ),
        ],
      ),
    );
  }
}
