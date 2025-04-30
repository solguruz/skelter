import 'package:equatable/equatable.dart';
import 'package:flutter_skeleton/analytics/main_event.dart';

abstract class ShippingAddressEvent extends Equatable
    implements AnalyticsEvent {
  const ShippingAddressEvent();

  @override
  Map<String, String>? getAnalyticParameters() {
    return {};
  }

  @override
  bool shouldLogEvent() {
    return false;
  }
}

class SelectedAddressIndexUpdateEvent extends ShippingAddressEvent {
  final int index;

  const SelectedAddressIndexUpdateEvent({required this.index});

  @override
  List<Object?> get props => [index];

  @override
  String get eventName => (SelectedAddressIndexUpdateEvent).toString();
}
