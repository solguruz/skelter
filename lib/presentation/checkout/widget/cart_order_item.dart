import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar_plus/flutter_rating_bar_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:sizer/sizer.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/gen/assets.gen.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/checkout/model/product_cart.dart';
import 'package:skelter/utils/app_environment.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

class CartOrderItem extends StatelessWidget {
  const CartOrderItem({
    super.key,
    required this.cartModel,
  });

  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    final isFromTestEnvironment = AppEnvironment.isTestEnvironment;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: context.currentTheme.strokeNeutralLight200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          if (isFromTestEnvironment)
            Image.asset(
              Assets.test.images.testImage.path,
              width: Device.width / 6,
              fit: BoxFit.cover,
            )
          else
            CachedNetworkImage(
              imageUrl: cartModel.product.image,
              width: Device.width / 6,
              fit: BoxFit.cover,
            ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        cartModel.product.category,
                        style: AppTextStyles.p3Medium.copyWith(
                          color: context.currentTheme.textNeutralSecondary,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: context.currentTheme.bgSurfaceBase2,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Icon(
                        TablerIcons.trash,
                        color: context.currentTheme.iconNeutralHover,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  cartModel.product.title,
                  style: AppTextStyles.p2Medium.copyWith(
                    color: context.currentTheme.textNeutralPrimary,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(height: 6),
                RatingBar.builder(
                  initialRating: cartModel.product.rating,
                  minRating: 1,
                  itemSize: 20,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                  itemBuilder: (context, _) => Icon(
                    TablerIcons.star_filled,
                    color: context.currentTheme.bgWarningHover,
                  ),
                  onRatingUpdate: (rating) {},
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      '\$${cartModel.product.price.toStringAsFixed(2)}',
                      style: AppTextStyles.p2SemiBold.copyWith(
                        color: context.currentTheme.textNeutralPrimary,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      TablerIcons.circle_minus,
                      color: cartModel.quantities > 1
                          ? context.currentTheme.textBrandSecondary
                          : context.currentTheme.bgBrandLight100,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      cartModel.quantities.toString(),
                      style: AppTextStyles.p2SemiBold.copyWith(
                        color: context.currentTheme.textBrandSecondary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      TablerIcons.circle_plus,
                      color: context.currentTheme.textBrandSecondary,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  cartModel.product.category,
                  style: AppTextStyles.p2Medium.copyWith(
                    color: context.currentTheme.textNeutralSecondary,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    SvgPicture.asset(
                      Assets.icons.deliveryParcel,
                      colorFilter: ColorFilter.mode(
                        context.currentTheme.bgBrandDefault,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        '${context.localization.expected_delivery_by} ',
                        style: AppTextStyles.p3Medium.copyWith(
                          color: context.currentTheme.textNeutralPrimary,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    Text(
                      cartModel.expectedDeliveryDate,
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
        ],
      ),
    );
  }
}
