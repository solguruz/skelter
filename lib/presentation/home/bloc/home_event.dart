import 'package:flutter_skeleton/analytics/main_event.dart';
import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable implements AnalyticsEvent {
  const HomeEvent();

  @override
  Map<String, String>? getAnalyticParameters() {
    return {};
  }

  @override
  bool shouldLogEvent() {
    return false;
  }
}

class BottomNavBarIndexChangedEvent extends HomeEvent {
  final int index;

  const BottomNavBarIndexChangedEvent({required this.index});

  @override
  List<Object> get props => [index];

  @override
  String get eventName => (BottomNavBarIndexChangedEvent).toString();
}
