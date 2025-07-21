import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/presentation/checkout/bloc/checkout_bloc.dart';
import 'package:flutter_skeleton/presentation/checkout/bloc/checkout_events.dart';
import 'package:flutter_skeleton/presentation/checkout/cart_screen.dart';
import 'package:flutter_skeleton/presentation/checkout/data/cart_sample_data.dart';
import 'package:flutter_skeleton/presentation/checkout/order_review_screen.dart';
import 'package:flutter_skeleton/presentation/checkout/payment_screen.dart';
import 'package:flutter_skeleton/presentation/checkout/shipping_screen.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/bottom_items.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/checkout_app_bar.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/custom_stepper.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/empty_cart_view.dart';

class InitialCheckoutScreen extends StatelessWidget {
  const InitialCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CheckoutBloc>(
      create: (context) => CheckoutBloc()..add(const InitialCalculationEvent()),
      child: const CheckoutScreenBody(),
    );
  }
}

class CheckoutScreenBody extends StatefulWidget {
  const CheckoutScreenBody({
    super.key,
  });

  @override
  State<CheckoutScreenBody> createState() => _CheckoutScreenBodyState();
}

class _CheckoutScreenBodyState extends State<CheckoutScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CheckoutAppBar(),
      bottomNavigationBar: cartSampleData.isEmpty ? null : const BottomItems(),
      body: cartSampleData.isEmpty
          ? const EmptyCartView()
          : const InitialCheckoutScreenBody(),
    );
  }
}

class InitialCheckoutScreenBody extends StatefulWidget {
  const InitialCheckoutScreenBody({super.key});

  @override
  State<InitialCheckoutScreenBody> createState() =>
      _InitialCheckoutScreenBodyState();
}

class _InitialCheckoutScreenBodyState extends State<InitialCheckoutScreenBody> {
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentStepperIndex = context.select<CheckoutBloc, int>(
      (bloc) => bloc.state.stepperIndex,
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            const CustomStepper(),
            Visibility(
              visible: currentStepperIndex == 0,
              maintainState: true,
              maintainAnimation: true,
              child: const CartScreen(),
            ),
            Visibility(
              visible: currentStepperIndex == 1,
              maintainState: true,
              maintainAnimation: true,
              child: const ShippingScreen(),
            ),
            Visibility(
              visible: currentStepperIndex == 2,
              maintainState: true,
              maintainAnimation: true,
              child: const PaymentScreen(),
            ),
            Visibility(
              visible: currentStepperIndex == 3,
              maintainState: true,
              maintainAnimation: true,
              child: const OrderReviewScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
