import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/presentation/checkout/bloc/checkout_bloc.dart';
import 'package:flutter_skeleton/presentation/checkout/bloc/checkout_state.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/cart_order_item.dart';

class CartItemLists extends StatelessWidget {
  const CartItemLists({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      builder: (context, state) {
        return ListView.separated(
          itemCount: state.cartData.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return CartOrderItem(cartModel: state.cartData[index]);
          },
          separatorBuilder: (context, index) => const Padding(
            padding: EdgeInsets.all(8),
          ),
        );
      },
    );
  }
}
