import 'package:equatable/equatable.dart';
import 'package:flutter_skeleton/presentation/notifications/data/notification_data_list.dart';
import 'package:flutter_skeleton/presentation/notifications/model/notification_model.dart';

class NotificationState with EquatableMixin {
  final bool isLoading;
  final List<NotificationModel> notificationList;
  final String message;

  NotificationState({
    required this.isLoading,
    required this.notificationList,
    this.message = '',
  });

  NotificationState.initial()
      : isLoading = false,
        notificationList = [],
        message = '';

  NotificationState.test()
      : notificationList = dummyNotifications,
        isLoading = false,
        message = '';

  NotificationState.copy(NotificationState state)
      : this(
          isLoading: state.isLoading,
          notificationList: state.notificationList,
          message: state.message,
        );

  NotificationState copyWith({
    bool? isLoading,
    List<NotificationModel>? notificationList,
    String? message,
  }) {
    return NotificationState(
      isLoading: isLoading ?? this.isLoading,
      notificationList: notificationList ?? this.notificationList,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [isLoading, notificationList, message];
}

class NotificationInitializeState extends NotificationState {
  NotificationInitializeState() : super.initial();
}

class NotificationDataLoadedState extends NotificationState {
  NotificationDataLoadedState(
    NotificationState state, {
    required List<NotificationModel> notificationList,
  }) : super.copy(
          state.copyWith(notificationList: notificationList, isLoading: false),
        );
}

class NotificationDeletedState extends NotificationDataLoadedState {
  NotificationDeletedState(super.state, {required super.notificationList});
}

class NotificationErrorState extends NotificationState {
  NotificationErrorState(
    NotificationState state, {
    required String message,
  }) : super.copy(
          state.copyWith(message: message, isLoading: false),
        );
}
