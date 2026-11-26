import 'package:material_ui/material_ui.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';
import 'package:skelter/widgets/shimmer/shimmer_content.dart';
import 'package:skelter/widgets/shimmer/shimmer_image.dart';

class MyOrdersShimmer extends StatelessWidget {
  const MyOrdersShimmer({
    super.key,
    this.showAnimation = true,
    this.itemCount = 2,
  });

  final bool showAnimation;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(12),
      itemCount: itemCount,
      separatorBuilder: (context, index) =>
          const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: context.currentTheme.bgNeutralLight100,
          highlightColor: context.currentTheme.bgNeutralLight50,
          enabled: showAnimation,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(
                color: context.currentTheme.strokeNeutralLight200,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    ShimmerContent(
                      height: 16,
                      width: MediaQuery.of(context).size.width * 0.4,
                      radius: 4,
                    ),
                    const ShimmerContent(height: 32, width: 80, radius: 8),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    ShimmerImage(
                      height: 80,
                      width: MediaQuery.of(context).size.width / 6,
                      radius: 8,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          ShimmerContent(
                            height: 14,
                            width: MediaQuery.of(context).size.width * 0.3,
                            radius: 4,
                          ),
                          const SizedBox(height: 8),
                          ShimmerContent(
                            height: 18,
                            width: MediaQuery.of(context).size.width * 0.5,
                            radius: 4,
                          ),
                          const SizedBox(height: 8),
                          const ShimmerContent(
                            height: 20,
                            width: 100,
                            radius: 4,
                          ),
                          const SizedBox(height: 8),
                          const ShimmerContent(
                            height: 16,
                            width: 80,
                            radius: 4,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const ShimmerContent(height: 24, width: 24, radius: 4),
                    const SizedBox(width: 10),
                    ShimmerContent(
                      height: 16,
                      width: MediaQuery.of(context).size.width * 0.6,
                      radius: 4,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
