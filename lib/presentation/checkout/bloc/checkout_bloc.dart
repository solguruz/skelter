import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/presentation/checkout/bloc/checkout_events.dart';
import 'package:flutter_skeleton/presentation/checkout/bloc/checkout_state.dart';
import 'package:flutter_skeleton/presentation/checkout/data/cart_sample_data.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(CheckoutState.initial()) {
    _setupEventListener();
  }

  void _setupEventListener() {
    on<StepperIndexUpdateEvent>(_onStepperIndexUpdateEvent);
    on<InitialCalculationEvent>(_onInitialCalculationEvent);
    on<SelectPaymentMethodEvent>(_onSelectPaymentMethodEvent);
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

  void _onSelectPaymentMethodEvent(
    SelectPaymentMethodEvent event,
    Emitter<CheckoutState> emit,
  ) {
    emit(
      state.copyWith(isPaymentMethodOnline: event.isPaymentMethodOnline),
    );
  }
}
