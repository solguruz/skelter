import 'package:flutter/material.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/shipping_details_cta.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/total_amount.dart';

class BottomItems extends StatelessWidget {
  const BottomItems({
    super.key,
    required this.finalAmount,
  });

  final String finalAmount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TotalAmount(finalAmount: finalAmount),
        const Spacer(),
        const ShippingDetailsCTA(),
      ],
    );
  }
}
