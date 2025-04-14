import 'package:flutter/material.dart';
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
          ShippingDetailsCTA(),
        ],
      ),
    );
  }
}
