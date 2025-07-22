import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/gen/assets.gen.dart';
import 'package:flutter_skeleton/utils/app_environment.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ProductImage extends StatelessWidget {
  final String imageUrl;

  const ProductImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final isFromTestEnvironment = AppEnvironment.isTestEnvironment;

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      child: AspectRatio(
        aspectRatio: 1.41,
        child: isFromTestEnvironment
            ? Image.asset(
                Assets.test.images.testImage.path,
                height: 88,
                width: 88,
                fit: BoxFit.cover,
              )
            : CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: AppColors.bgNeutralLight100,
                  highlightColor: AppColors.bgNeutralLight100.withOpacity(0.6),
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
    );
  }
}
