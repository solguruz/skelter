import 'package:equatable/equatable.dart';
import 'package:flutter_skeleton/analytics/analytics_parameters.dart';
import 'package:flutter_skeleton/analytics/main_event.dart';

abstract class NotificationEvent with EquatableMixin implements AnalyticsEvent {
  @override
  Map<String, String>? getAnalyticParameters() {
    return {};
  }

  @override
  bool shouldLogEvent() {
    return false;
  }

  @override
  String get eventName;
}

class NotificationLoadingEvent extends NotificationEvent {
  final bool isLoading;

  NotificationLoadingEvent({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];

  @override
  Map<String, String>? getAnalyticParameters() {
    return {
      NotificationAnalyticsParams.kIsLoading: isLoading.toString(),
    };
  }

  @override
  String get eventName => (NotificationLoadingEvent).toString();
}

class InitializeNotificationEvent extends NotificationEvent {
  @override
  List<Object?> get props => [];

  @override
  Map<String, String>? getAnalyticParameters() {
    return {};
  }

  @override
  String get eventName => (InitializeNotificationEvent).toString();
}

class GetNotificationDataEvent extends NotificationEvent {
  @override
  List<Object?> get props => [];

  @override
  Map<String, String>? getAnalyticParameters() {
    return {};
  }

  @override
  String get eventName => (GetNotificationDataEvent).toString();
}

class DeleteNotificationEvent extends NotificationEvent {
  final String notificationId;

  DeleteNotificationEvent({required this.notificationId});
  @override
  List<Object?> get props => [];

  @override
  Map<String, String>? getAnalyticParameters() {
    return {
      NotificationAnalyticsParams.kNotificationId: notificationId,
    };
  }

  @override
  String get eventName => (DeleteNotificationEvent).toString();
}

class NotificationErrorEvent extends NotificationEvent {
  final String msg;

  NotificationErrorEvent({required this.msg});

  @override
  List<Object?> get props => [msg];

  @override
  Map<String, String>? getAnalyticParameters() {
    return {
      NotificationAnalyticsParams.kMessage: msg,
    };
  }

  @override
  String get eventName => (NotificationErrorEvent).toString();
}
