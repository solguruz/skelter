import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/presentation/checkout/bloc/checkout_bloc.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/confirm_and_pay_button.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/review_order_button.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/select_payment_method_button.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/shipping_details_button.dart';
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
          GetCartActionButton(),
        ],
      ),
    );
  }
}

class GetCartActionButton extends StatelessWidget {
  const GetCartActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final currentStepperIndex = context.select<CheckoutBloc, int>(
      (bloc) => bloc.state.stepperIndex,
    );
    switch (currentStepperIndex) {
      case 0:
        return const ShippingDetailsButton();
      case 1:
        return const SelectPaymentMethodButton();
      case 2:
        return const SelectAndReviewOrderButton();
      case 3:
        return const ConfirmAndPayButton();
      default:
        return const ShippingDetailsButton();
    }
  }
}
