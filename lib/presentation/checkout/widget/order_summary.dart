import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/checkout/bloc/checkout_bloc.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final totalPrice = context.select<CheckoutBloc, double>(
      (bloc) => bloc.state.totalPrice,
    );
    final discount = context.select<CheckoutBloc, double>(
      (bloc) => bloc.state.discount,
    );
    final deliveryCharges = context.select<CheckoutBloc, double>(
      (bloc) => bloc.state.deliveryCharges,
    );
    final finalAmount = context.select<CheckoutBloc, double>(
      (bloc) => bloc.state.finalAmount,
    );

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.strokeNeutralLight200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.order_summary,
            style: AppTextStyles.h6Bold.withColor(
              AppColors.textNeutralPrimary,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                context.l10n.price_of_items(2),
                style: AppTextStyles.p3Regular
                    .withColor(AppColors.textNeutralPrimary),
              ),
              const Spacer(),
              Text(
                '\$${totalPrice.toStringAsFixed(2)}',
                style: AppTextStyles.p3Regular
                    .withColor(AppColors.textNeutralPrimary),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                context.l10n.discount,
                style: AppTextStyles.p3Regular
                    .withColor(AppColors.textNeutralPrimary),
              ),
              const Spacer(),
              Text(
                '\$$discount',
                style: AppTextStyles.p3Regular
                    .withColor(AppColors.textSuccessSecondary),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                context.l10n.delivery_charges,
                style: AppTextStyles.p3Regular
                    .withColor(AppColors.textNeutralPrimary),
              ),
              const Spacer(),
              Text(
                '\$$deliveryCharges',
                style: AppTextStyles.p3Regular
                    .withColor(AppColors.textNeutralPrimary),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                context.l10n.total_amount,
                style: AppTextStyles.h6Medium
                    .withColor(AppColors.textNeutralPrimary),
              ),
              const Spacer(),
              Text(
                '\$$finalAmount',
                style: AppTextStyles.h6Bold
                    .withColor(AppColors.textNeutralPrimary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
