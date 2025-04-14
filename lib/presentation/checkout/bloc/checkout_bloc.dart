import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/logger/app_logging.dart';
import 'package:flutter_skeleton/presentation/checkout/bloc/checkout_events.dart';
import 'package:flutter_skeleton/presentation/checkout/bloc/checkout_state.dart';
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
  }

  void _onStepperIndexUpdateEvent(
    StepperIndexUpdateEvent event,
    Emitter<CheckoutState> emit,
  ) {
    emit(state.copyWith(stepperIndex: event.index));
  }
}

extension CheckoutBlocExtension on BuildContext {
  CheckoutBloc get checkoutBloc => BlocProvider.of<CheckoutBloc>(this);
}
