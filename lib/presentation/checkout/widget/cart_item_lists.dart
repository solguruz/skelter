import 'package:flutter/material.dart';
import 'package:flutter_skeleton/presentation/checkout/data/cart_sample_data.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/cart_order_item.dart';

class CartItemLists extends StatelessWidget {
  const CartItemLists({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: cartSampleData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return CartOrderItem(cartModel: cartSampleData[index]);
      },
      separatorBuilder: (context, index) => const Padding(
        padding: EdgeInsets.all(8),
      ),
    );
  }
}
