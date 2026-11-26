import 'package:material_ui/material_ui.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';
import 'package:skelter/widgets/shimmer/shimmer_circular_image.dart';
import 'package:skelter/widgets/shimmer/shimmer_text.dart';

class ChatShimmer extends StatelessWidget {
  const ChatShimmer({super.key, this.showAnimation = true});

  final bool showAnimation;

  @override
  Widget build(BuildContext context) {
    const double profileImageSize = 14.0;
    return Shimmer.fromColors(
      baseColor: context.currentTheme.bgNeutralLight200,
      enabled: showAnimation,
      highlightColor: context.currentTheme.bgNeutralLight100,
      child: const Row(
        mainAxisSize: .min,
        children: [
          ShimmerCircularImage(size: profileImageSize),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              mainAxisSize: .min,
              children: [
                ShimmerText(width: 60),
                SizedBox(height: 4.0),
                ShimmerText(width: double.infinity),
              ],
            ),
          ),
          SizedBox(width: 32.0),
          Column(
            mainAxisSize: .min,
            crossAxisAlignment: .end,
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
