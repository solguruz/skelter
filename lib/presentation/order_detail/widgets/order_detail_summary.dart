import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/my_orders/bloc/my_order_bloc.dart';
import 'package:skelter/presentation/product_detail/domain/entities/product_detail.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class OrderDetailSummary extends StatelessWidget {
  const OrderDetailSummary({super.key});

  static const int _quantity = 1;
  static const double _discountPercent = 0.10;
  static const double _deliveryCharges = 10.0;

  @override
  Widget build(BuildContext context) {
    final productDetail = context.select<MyOrderBloc, ProductDetail>(
      (bloc) => bloc.state.selectedProductDetail!,
    );

    final itemPrice = productDetail.price * _quantity;
    final discount = (itemPrice * _discountPercent * 100).floor() / 100;
    final totalAmount =
        ((itemPrice - discount + _deliveryCharges) * 100).floor() / 100;

    return Column(
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
              Text(
                context.localization.order_summary,
                style: AppTextStyles.h6Bold.copyWith(
                  color: context.currentTheme.textNeutralPrimary,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Text(
                    context.localization.price_of_items(_quantity),
                    style: AppTextStyles.p3Regular.copyWith(
                      color: context.currentTheme.textNeutralPrimary,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '\$${itemPrice.toStringAsFixed(2)}',
                    style: AppTextStyles.p3Regular.copyWith(
                      color: context.currentTheme.textNeutralPrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    context.localization.discount,
                    style: AppTextStyles.p3Regular.copyWith(
                      color: context.currentTheme.textNeutralPrimary,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '-\$${discount.toStringAsFixed(2)}',
                    style: AppTextStyles.p3Regular.copyWith(
                      color: context.currentTheme.textSuccessSecondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    context.localization.delivery_charges,
                    style: AppTextStyles.p3Regular.copyWith(
                      color: context.currentTheme.textNeutralPrimary,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '\$${_deliveryCharges.toStringAsFixed(0)}',
                    style: AppTextStyles.p3Regular.copyWith(
                      color: context.currentTheme.textNeutralPrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    context.localization.total_amount,
                    style: AppTextStyles.h6Medium.copyWith(
                      color: context.currentTheme.textNeutralPrimary,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '\$${totalAmount.toStringAsFixed(2)}',
                    style: AppTextStyles.h6Bold.copyWith(
                      color: context.currentTheme.textNeutralPrimary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
