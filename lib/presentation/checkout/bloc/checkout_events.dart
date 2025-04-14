import 'package:equatable/equatable.dart';
import 'package:flutter_skeleton/analytics/main_event.dart';

abstract class CheckoutEvent extends Equatable implements AnalyticsEvent {
  const CheckoutEvent();

  @override
  Map<String, String>? getAnalyticParameters() {
    return {};
  }

  @override
  bool shouldLogEvent() {
    return false;
  }
}

class InitialCalculationEvent extends CheckoutEvent {
  const InitialCalculationEvent();

  @override
  List<Object?> get props => [];

  @override
  String get eventName => (InitialCalculationEvent).toString();
}

class StepperIndexUpdateEvent extends CheckoutEvent {
  final int index;

  const StepperIndexUpdateEvent({required this.index});

  @override
  List<Object> get props => [index];

  @override
  String get eventName => (StepperIndexUpdateEvent).toString();
}
