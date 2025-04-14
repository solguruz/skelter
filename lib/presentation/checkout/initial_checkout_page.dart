import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/presentation/checkout/bloc/checkout_bloc.dart';
import 'package:flutter_skeleton/presentation/checkout/bloc/checkout_events.dart';
import 'package:flutter_skeleton/presentation/checkout/cart_page.dart';
import 'package:flutter_skeleton/presentation/checkout/shipping_page.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/bottom_items.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/checkout_app_bar.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/custom_stepper.dart';

class InitialCheckoutPage extends StatelessWidget {
  const InitialCheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CheckoutBloc>(
      create: (context) => CheckoutBloc()..add(const InitialCalculationEvent()),
      child: const CheckoutPageBody(),
    );
  }
}

class CheckoutPageBody extends StatefulWidget {
  static final ScrollController scrollController = ScrollController();

  const CheckoutPageBody({
    super.key,
  });

  @override
  State<CheckoutPageBody> createState() => _CheckoutPageBodyState();
}

class _CheckoutPageBodyState extends State<CheckoutPageBody> {
  @override
  void dispose() {
    CheckoutPageBody.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentStepperIndex = context.select<CheckoutBloc, int>(
      (bloc) => bloc.state.stepperIndex,
    );

    return Scaffold(
      appBar: const CheckoutAppBar(),
      bottomNavigationBar: const BottomItems(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          controller: CheckoutPageBody.scrollController,
          child: Column(
            children: [
              const CustomStepper(),
              // Can use IndexedStack but it causes extra height issue
              // i.e. if child 1 is bigger then another, all the children
              // will be as big as child 1
              Visibility(
                visible: currentStepperIndex == 0,
                maintainState: true,
                maintainAnimation: true,
                child: const CartPage(),
              ),
              Visibility(
                visible: currentStepperIndex == 1,
                maintainState: true,
                maintainAnimation: true,
                child: const ShippingPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
