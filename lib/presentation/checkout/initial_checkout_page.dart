import 'package:flutter/material.dart';
import 'package:flutter_skeleton/presentation/checkout/cart_page.dart';
import 'package:flutter_skeleton/presentation/checkout/shipping_page.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/checkout_app_bar.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/custom_stepper.dart';

class InitialCheckoutPage extends StatelessWidget {
  const InitialCheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CheckoutAppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomStepper(),
              IndexedStack(
                children: [
                  CartPage(),
                  ShippingPage(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
