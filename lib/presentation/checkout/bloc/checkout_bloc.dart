import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/logger/app_logging.dart';
import 'package:flutter_skeleton/presentation/checkout/bloc/checkout_events.dart';
import 'package:flutter_skeleton/presentation/checkout/bloc/checkout_state.dart';
import 'package:flutter_skeleton/presentation/checkout/data/cart_sample_data.dart';
import 'package:flutter_skeleton/utils/analytics_helper.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> with Loggable {
  CheckoutBloc() : super(CheckoutState.initial()) {
    _setupEventListener();
  }

  @override
  void onEvent(CheckoutEvent event) {
    super.onEvent(event);
    AnalyticsHelper().logCustomEvent(
      event.eventName,
      parameters: event.getAnalyticParameters(),
    );
  }

  @override
  String get className => (CheckoutBloc).toString();

  void _setupEventListener() {
    on<StepperIndexUpdateEvent>(_onStepperIndexUpdateEvent);
    on<InitialCalculationEvent>(_onInitialCalculationEvent);
  }

  void _onInitialCalculationEvent(
    InitialCalculationEvent event,
    Emitter<CheckoutState> emit,
  ) {
    final totalPrice = cartSampleData.fold(
      0.0,
      (total, item) => total + (item.product.price * item.quantities),
    );
    const discount = 25.9;
    const deliveryCharges = 10.0;
    final finalAmount =
        ((totalPrice - discount) + deliveryCharges).toStringAsFixed(2);

    emit(
      state.copyWith(
        totalPrice: totalPrice,
        discount: discount,
        deliveryCharges: deliveryCharges,
        finalAmount: double.parse(finalAmount),
      ),
    );
  }

  void _onStepperIndexUpdateEvent(
    StepperIndexUpdateEvent event,
    Emitter<CheckoutState> emit,
  ) {
    emit(StepperIndexUpdateState(state, index: event.index));
  }
}

extension CheckoutBlocExtension on BuildContext {
  CheckoutBloc get checkoutBloc => BlocProvider.of<CheckoutBloc>(this);
}
