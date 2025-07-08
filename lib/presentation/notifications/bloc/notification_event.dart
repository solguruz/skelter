import 'package:equatable/equatable.dart';

abstract class NotificationEvent with EquatableMixin {}

class NotificationLoadingEvent extends NotificationEvent {
  final bool isLoading;

  NotificationLoadingEvent({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];
}

class InitializeNotificationEvent extends NotificationEvent {
  @override
  List<Object?> get props => [];
}

class GetNotificationDataEvent extends NotificationEvent {
  @override
  List<Object?> get props => [];
}

class DeleteNotificationEvent extends NotificationEvent {
  final String notificationId;

  DeleteNotificationEvent({required this.notificationId});

  @override
  List<Object?> get props => [];
}

class NotificationErrorEvent extends NotificationEvent {
  final String msg;

  NotificationErrorEvent({required this.msg});

  @override
  List<Object?> get props => [msg];
}
