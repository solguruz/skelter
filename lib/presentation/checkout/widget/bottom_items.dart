import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/presentation/checkout/bloc/checkout_bloc.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/confirm_and_pay_cta.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/review_order_cta.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/select_payment_method_cta.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/shipping_details_cta.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/total_amount.dart';

class BottomItems extends StatelessWidget {
  const BottomItems({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          TotalAmount(),
          Spacer(),
          GetCartActionCTA(),
        ],
      ),
    );
  }
}

class GetCartActionCTA extends StatelessWidget {
  const GetCartActionCTA({super.key});

  @override
  Widget build(BuildContext context) {
    final currentStepperIndex = context.select<CheckoutBloc, int>(
      (bloc) => bloc.state.stepperIndex,
    );
    switch (currentStepperIndex) {
      case 0:
        return const ShippingDetailsCTA();
      case 1:
        return const SelectPaymentMethodCTA();
      case 2:
        return const SelectAndReviewOrderCTA();
      case 3:
        return const ConfirmAndPayCTA();
      default:
        return const ShippingDetailsCTA();
    }
  }
}
