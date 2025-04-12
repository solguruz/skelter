import 'package:flutter/material.dart';
import 'package:flutter_rating_bar_plus/flutter_rating_bar_plus.dart';
import 'package:flutter_skeleton/common/app_icons/app_icon.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/gen/assets.gen.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/checkout/model/product_cart.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class CartOrderItem extends StatelessWidget {
  const CartOrderItem({
    super.key,
    required this.cartModel,
  });

  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.strokeNeutralLight200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.asset(cartModel.product.image),
          const SizedBox(width: 35),
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
                        style: AppTextStyles.p3Medium.withColor(
                          AppColors.textNeutralSecondary,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    const Icon(
                      TablerIcons.trash,
                      color: AppColors.iconNeutralHover,
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  cartModel.product.title,
                  style: AppTextStyles.p2Medium
                      .withColor(AppColors.textNeutralPrimary),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(height: 6),
                RatingBar.builder(
                  initialRating: 4,
                  minRating: 1,
                  itemSize: 20,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                  itemBuilder: (context, _) => const Icon(
                    TablerIcons.star_filled,
                    color: AppColors.bgWarningHover,
                  ),
                  onRatingUpdate: (rating) {},
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      '\$${cartModel.product.price.toStringAsFixed(2)}',
                      style: AppTextStyles.p2SemiBold.withColor(
                        AppColors.textNeutralPrimary,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      TablerIcons.circle_minus,
                      color: cartModel.quantities > 1
                          ? AppColors.textBrandSecondary
                          : AppColors.bgBrandLight100,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      cartModel.quantities.toString(),
                      style: AppTextStyles.p2SemiBold.withColor(
                        AppColors.textBrandSecondary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      TablerIcons.circle_plus,
                      color: AppColors.textBrandSecondary,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  cartModel.product.category,
                  style: AppTextStyles.p2Medium.withColor(
                    AppColors.textNeutralSecondary,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    AppIcon(
                      iconPath: Assets.icons.deliveryParcel,
                      color: AppColors.bgBrandDefault,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        '${context.l10n.expected_delivery_by} ',
                        style: AppTextStyles.p3Medium.withColor(
                          AppColors.textNeutralPrimary,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    Text(
                      cartModel.expectedDeliveryDate,
                      style: AppTextStyles.p3Medium.withColor(
                        AppColors.bgBrandDefault,
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
