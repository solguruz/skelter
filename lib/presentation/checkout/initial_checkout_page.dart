import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/presentation/checkout/bloc/checkout_bloc.dart';
import 'package:flutter_skeleton/presentation/checkout/cart_page.dart';
import 'package:flutter_skeleton/presentation/checkout/shipping_page.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/checkout_app_bar.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/custom_stepper.dart';

class InitialCheckoutPage extends StatelessWidget {
  const InitialCheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CheckoutAppBar(),
      body: BlocProvider<CheckoutBloc>(
        create: (context) => CheckoutBloc(),
        child: const CheckoutPageBody(),
      ),
    );
  }
}

class CheckoutPageBody extends StatelessWidget {
  const CheckoutPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentStepperIndex = context.select<CheckoutBloc, int>(
      (bloc) => bloc.state.stepperIndex,
    );
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomStepper(),
            IndexedStack(
              index: currentStepperIndex,
              children: [
                const CartPage(),
                const ShippingPage(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
