import 'package:material_ui/material_ui.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';
import 'package:skelter/widgets/shimmer/shimmer_content.dart';
import 'package:skelter/widgets/shimmer/shimmer_image.dart';

class OrderDetailShimmer extends StatelessWidget {
  const OrderDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.currentTheme.bgNeutralLight100,
      highlightColor: context.currentTheme.bgNeutralLight50,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Container(
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
                    crossAxisAlignment: .start,
                    children: [
                      ShimmerImage(
                        height: 80,
                        width: MediaQuery.of(context).size.width / 5,
                        radius: 8,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            ShimmerContent(
                              height: 14,
                              width: MediaQuery.of(context).size.width * 0.2,
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
                              height: 16,
                              width: 100,
                              radius: 4,
                            ),
                            const SizedBox(height: 8),
                            const ShimmerContent(
                              height: 20,
                              width: 60,
                              radius: 4,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ShimmerContent(
                    height: 16,
                    width: MediaQuery.of(context).size.width * 0.6,
                    radius: 4,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const ShimmerContent(height: 20, width: 120, radius: 4),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: context.currentTheme.strokeNeutralLight200,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const ShimmerImage(height: 40, width: 40, radius: 8),
                  const SizedBox(width: 12),
                  ShimmerContent(
                    height: 16,
                    width: MediaQuery.of(context).size.width * 0.5,
                    radius: 4,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const ShimmerContent(height: 20, width: 120, radius: 4),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: context.currentTheme.strokeNeutralLight200,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: EdgeInsets.only(bottom: index < 2 ? 16 : 0),
                    child: Row(
                      crossAxisAlignment: .start,
                      children: [
                        const ShimmerContent(height: 24, width: 24, radius: 12),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              Row(
                                mainAxisAlignment: .spaceBetween,
                                children: [
                                  ShimmerContent(
                                    height: 16,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    radius: 4,
                                  ),
                                  const ShimmerContent(
                                    height: 14,
                                    width: 80,
                                    radius: 4,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              ShimmerContent(
                                height: 14,
                                width: MediaQuery.of(context).size.width * 0.6,
                                radius: 4,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const ShimmerContent(height: 20, width: 140, radius: 4),
            const SizedBox(height: 12),
            Container(
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
                  ShimmerContent(
                    height: 16,
                    width: MediaQuery.of(context).size.width * 0.3,
                    radius: 4,
                  ),
                  const SizedBox(height: 8),
                  ShimmerContent(
                    height: 14,
                    width: MediaQuery.of(context).size.width * 0.7,
                    radius: 4,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
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
                  const ShimmerContent(height: 20, width: 120, radius: 4),
                  const SizedBox(height: 16),
                  ...List.generate(
                    4,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          ShimmerContent(
                            height: 16,
                            width: MediaQuery.of(context).size.width * 0.3,
                            radius: 4,
                          ),
                          const ShimmerContent(
                            height: 16,
                            width: 60,
                            radius: 4,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ShimmerContent(
                    height: 48,
                    width: MediaQuery.of(context).size.width * 0.4,
                    radius: 8,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ShimmerContent(
                    height: 48,
                    width: MediaQuery.of(context).size.width * 0.4,
                    radius: 8,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
