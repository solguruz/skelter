import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skelter/gen/assets.gen.dart';
import 'package:skelter/utils/app_environment.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

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
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              )
            : CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: context.currentTheme.bgNeutralLight100,
                  highlightColor:
                      context.currentTheme.bgNeutralLight100.withOpacity(0.6),
                  child: ColoredBox(
                    color: context.currentTheme.bgNeutralLight100,
                  ),
                ),
                errorWidget: (context, url, error) => ColoredBox(
                  color: context.currentTheme.bgNeutralLight100,
                  child: Icon(
                    Icons.error_outline,
                    color: context.currentTheme.bgErrorHover,
                  ),
                ),
              ),
      ),
    );
  }
}
