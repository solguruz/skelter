import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/checkout/bloc/checkout_bloc.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/cart_item_lists.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/order_summary.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/select_payment_method_from_list.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/shipping_address.dart';

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
          style: AppTextStyles.p2Bold,
        ),
        const SizedBox(height: 12),
        const ShippingAddress(),
        const SizedBox(height: 16),
        Text(
          context.localization.selected_payment_method,
          style: AppTextStyles.p2SemiBold,
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
