import 'package:flutter/material.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/apply_coupon.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/order_summary.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/payment_method_header.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/select_payment_method_from_list.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        PaymentMethodHeader(),
        SelectPaymentMethodFromList(),
        SizedBox(height: 16),
        ApplyCoupon(),
        SizedBox(height: 20),
        OrderSummary(),
        SizedBox(height: 16),
      ],
    );
  }
}
