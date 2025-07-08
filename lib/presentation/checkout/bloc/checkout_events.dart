import 'package:equatable/equatable.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();
}

class InitialCalculationEvent extends CheckoutEvent {
  const InitialCalculationEvent();

  @override
  List<Object?> get props => [];
}

class StepperIndexUpdateEvent extends CheckoutEvent {
  final int index;

  const StepperIndexUpdateEvent({required this.index});

  @override
  List<Object> get props => [index];
}

class SelectPaymentMethodEvent extends CheckoutEvent {
  final bool isPaymentMethodOnline;

  const SelectPaymentMethodEvent({required this.isPaymentMethodOnline});

  @override
  List<Object> get props => [isPaymentMethodOnline];
}
