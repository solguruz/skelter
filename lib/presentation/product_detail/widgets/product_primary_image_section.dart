import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skelter/gen/assets.gen.dart';
import 'package:skelter/utils/app_environment.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class ProductPrimaryImageSection extends StatelessWidget {
  final String mainImage;
  final List<String> additionalImages;
  final int selectedImageIndex;
  final Function(int) onImageChanged;

  const ProductPrimaryImageSection({
    super.key,
    required this.mainImage,
    this.additionalImages = const [],
    required this.selectedImageIndex,
    required this.onImageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final allImages = [mainImage, ...additionalImages];
    final imageUrl = allImages[selectedImageIndex];
    final isFromTestEnvironment = AppEnvironment.isTestEnvironment;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            onImageChanged(selectedImageIndex);
          },
          child: Container(
            height: 300,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: isFromTestEnvironment
                ? Image.asset(
                    Assets.test.images.testImage.path,
                    fit: BoxFit.cover,
                  )
                : CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: AppColors.bgNeutralLight100,
                      highlightColor:
                          AppColors.bgNeutralLight100.withOpacity(0.6),
                      child: const ColoredBox(
                        color: AppColors.bgNeutralLight100,
                      ),
                    ),
                    errorWidget: (context, url, error) => const ColoredBox(
                      color: AppColors.bgNeutralLight100,
                      child: Icon(
                        Icons.error_outline,
                        color: AppColors.redError500,
                      ),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
