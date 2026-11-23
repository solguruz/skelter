import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/presentation/home/domain/entities/product.dart';
import 'package:skelter/routes.gr.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class AiChatProductCard extends StatelessWidget {
  const AiChatProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        context.router.push(ProductDetailRoute(productId: product.id));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: context.currentTheme.bgSurfaceBase,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: context.currentTheme.strokeNeutralLight100),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 56,
                height: 56,
                child: CachedNetworkImage(
                  imageUrl: product.image,
                  fit: .cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: context.currentTheme.bgNeutralLight100,
                    highlightColor: context.currentTheme.bgNeutralLight100
                        .withValues(alpha: 0.6),
                    child: ColoredBox(
                      color: context.currentTheme.bgNeutralLight100,
                    ),
                  ),
                  errorWidget: (context, url, error) => ColoredBox(
                    color: context.currentTheme.bgNeutralLight100,
                    child: Icon(
                      Icons.error_outline,
                      color: context.currentTheme.bgErrorHover,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                mainAxisSize: .min,
                children: [
                  Text(
                    product.title,
                    maxLines: 1,
                    overflow: .ellipsis,
                    style: AppTextStyles.p4SemiBold.copyWith(
                      color: context.currentTheme.textNeutralPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: AppTextStyles.p4Bold.copyWith(
                      color: context.currentTheme.textBrandPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(
                        TablerIcons.star_filled,
                        size: 12,
                        color: context.currentTheme.textWarningPrimary,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        '${product.rating}',
                        style: AppTextStyles.c2Medium.copyWith(
                          color: context.currentTheme.textNeutralSecondary,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '(${product.reviews})',
                        style: AppTextStyles.c2Regular.copyWith(
                          color: context.currentTheme.textNeutralSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(
              TablerIcons.chevron_right,
              size: 18,
              color: context.currentTheme.iconNeutralDefault,
            ),
          ],
        ),
      ),
    );
  }
}
