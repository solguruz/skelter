import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/checkout/bloc/checkout_bloc.dart';
import 'package:skelter/presentation/checkout/widget/cart_item_lists.dart';
import 'package:skelter/presentation/checkout/widget/order_summary.dart';
import 'package:skelter/presentation/checkout/widget/select_payment_method_from_list.dart';
import 'package:skelter/presentation/checkout/widget/shipping_address.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

class OrderReviewScreen extends StatelessWidget {
  const OrderReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isPaymentMethodOnline = context.select<CheckoutBloc, bool>(
      (bloc) => bloc.state.isPaymentMethodOnline,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CartItemLists(),
        const SizedBox(height: 16),
        Text(
          context.localization.shipping_address,
          style: AppTextStyles.p2SemiBold.copyWith(
            color: context.currentTheme.textNeutralPrimary,
          ),
        ),
        const SizedBox(height: 12),
        const ShippingAddress(),
        const SizedBox(height: 16),
        Text(
          context.localization.selected_payment_method,
          style: AppTextStyles.p2SemiBold.copyWith(
            color: context.currentTheme.textNeutralPrimary,
          ),
        ),
        const SizedBox(height: 12),
        if (isPaymentMethodOnline)
          const PaymentMethodOnline()
        else
          const PaymentMethodCOD(),
        const SizedBox(height: 12),
        const OrderSummary(),
      ],
    );
  }
}
