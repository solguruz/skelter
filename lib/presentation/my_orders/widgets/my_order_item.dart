import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar_plus/flutter_rating_bar_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:sizer/sizer.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/gen/assets.gen.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/home/domain/entities/product.dart';
import 'package:skelter/routes.gr.dart';
import 'package:skelter/utils/app_environment.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class MyOrderItem extends StatelessWidget {
  const MyOrderItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final isFromTestEnvironment = AppEnvironment.isTestEnvironment;
    return GestureDetector(
      onTap: () => context.router.push(OrderDetailRoute(productId: product.id)),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: context.currentTheme.strokeNeutralLight200),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${context.localization.order_id}${product.id}',
                    style: AppTextStyles.p4Medium.copyWith(
                      color: context.currentTheme.textNeutralSecondary,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: context.currentTheme.bgBrandLight50,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    context.localization.accepted,
                    style: AppTextStyles.p4Medium.copyWith(
                      color: context.currentTheme.textBrandSecondary,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                if (isFromTestEnvironment)
                  Image.asset(
                    Assets.test.images.testImage.path,
                    width: Device.width / 6,
                    fit: .cover,
                  )
                else
                  CachedNetworkImage(
                    imageUrl: product.image,
                    width: Device.width / 6,
                    fit: .cover,
                  ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    mainAxisAlignment: .spaceEvenly,
                    children: [
                      Text(
                        product.category,
                        style: AppTextStyles.p3Medium.copyWith(
                          color: context.currentTheme.textNeutralSecondary,
                        ),
                        overflow: .ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        product.title,
                        style: AppTextStyles.p2Medium.copyWith(
                          color: context.currentTheme.textNeutralPrimary,
                        ),
                        overflow: .ellipsis,
                        maxLines: 2,
                      ),
                      const SizedBox(height: 5),
                      RatingBar.builder(
                        initialRating: product.rating,
                        minRating: 1,
                        itemSize: 20,
                        allowHalfRating: true,
                        ignoreGestures: true,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                        itemBuilder: (context, _) => Icon(
                          TablerIcons.star_filled,
                          color: context.currentTheme.bgWarningHover,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: AppTextStyles.p2SemiBold.copyWith(
                          color: context.currentTheme.textNeutralPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                SvgPicture.asset(
                  Assets.icons.deliveryParcel,
                  colorFilter: ColorFilter.mode(
                    context.currentTheme.bgBrandDefault,
                    .srcIn,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  '${context.localization.expected_delivery_by} ',
                  style: AppTextStyles.p3Medium.copyWith(
                    color: context.currentTheme.textNeutralPrimary,
                  ),
                  overflow: .ellipsis,
                  maxLines: 1,
                ),
                Text(
                  'Dec 20, 2025',
                  style: AppTextStyles.p3Medium.copyWith(
                    color: context.currentTheme.bgBrandDefault,
                  ),
                  maxLines: 1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
