import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';
import 'package:skelter/widgets/shimmer/shimmer_text.dart';

class NotificationShimmerCard extends StatelessWidget {
  const NotificationShimmerCard({
    super.key,
    required this.showAnimation,
  });

  final bool showAnimation;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.currentTheme.bgNeutralLight200,
      enabled: showAnimation,
      highlightColor: context.currentTheme.bgNeutralLight100,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: context.currentTheme.bgShadesWhite,
              radius: 16.0,
            ),
            const SizedBox(
              width: 12.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerText(width: MediaQuery.of(context).size.width * 0.3),
                  const SizedBox(
                    height: 4.0,
                  ),
                  const ShimmerText(width: double.infinity),
                  const SizedBox(
                    height: 4.0,
                  ),
                  ShimmerText(width: MediaQuery.of(context).size.width * 0.2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
