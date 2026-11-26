import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar_plus/flutter_rating_bar_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:sizer/sizer.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/constants/constants.dart';
import 'package:skelter/gen/assets.gen.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/my_orders/bloc/my_order_bloc.dart';
import 'package:skelter/presentation/product_detail/domain/entities/product_detail.dart';
import 'package:skelter/utils/app_environment.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class OrderDetailProductCard extends StatelessWidget {
  const OrderDetailProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isFromTestEnvironment = AppEnvironment.isTestEnvironment;
    final productDetail = context.select<MyOrderBloc, ProductDetail>(
      (bloc) => bloc.state.selectedProductDetail!,
    );

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: context.currentTheme.strokeNeutralLight200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '${context.localization.order_id}${productDetail.id}',
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
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: .start,
            children: [
              if (isFromTestEnvironment)
                Image.asset(
                  Assets.test.images.testImage.path,
                  width: Device.width / 5,
                  fit: .cover,
                )
              else
                CachedNetworkImage(
                  imageUrl: productDetail.image,
                  width: Device.width / 5,
                  fit: .cover,
                ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      productDetail.category.toUpperCase(),
                      style: AppTextStyles.p4Medium.copyWith(
                        color: context.currentTheme.textNeutralSecondary,
                      ),
                      overflow: .ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      productDetail.title,
                      style: AppTextStyles.p2Medium.copyWith(
                        color: context.currentTheme.textNeutralPrimary,
                      ),
                      overflow: .ellipsis,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: productDetail.rating,
                          minRating: 1,
                          itemSize: 16,
                          ignoreGestures: true,
                          allowHalfRating: true,
                          itemPadding: const EdgeInsets.symmetric(
                            horizontal: 1,
                          ),
                          itemBuilder: (context, _) => Icon(
                            TablerIcons.star_filled,
                            color: context.currentTheme.bgWarningHover,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '(${productDetail.rating.toStringAsFixed(1)})',
                          style: AppTextStyles.p4Regular.copyWith(
                            color: context.currentTheme.textNeutralSecondary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\$${productDetail.price.toStringAsFixed(2)}',
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
              const SizedBox(width: 8),
              Text(
                '${context.localization.expected_delivery_by} ',
                style: AppTextStyles.p3Medium.copyWith(
                  color: context.currentTheme.textNeutralPrimary,
                ),
              ),
              Text(
                expectedDeliveryDate,
                style: AppTextStyles.p3Medium.copyWith(
                  color: context.currentTheme.bgBrandDefault,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
