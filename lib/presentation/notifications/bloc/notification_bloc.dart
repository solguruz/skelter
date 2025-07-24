import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/presentation/notifications/bloc/notification_event.dart';
import 'package:flutter_skeleton/presentation/notifications/bloc/notification_state.dart';
import 'package:flutter_skeleton/presentation/notifications/data/notification_data_list.dart';
import 'package:flutter_skeleton/presentation/notifications/model/notification_model.dart';
import 'package:flutter_skeleton/utils/app_environment.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitializeState()) {
    on<InitializeNotificationEvent>(_initializeNotification);
    on<NotificationLoadingEvent>(_onNotificationLoadingEvent);
    on<GetNotificationDataEvent>(_onGetNotificationDataEvent);
    on<NotificationErrorEvent>(_onNotificationErrorEvent);
    on<DeleteNotificationEvent>(_onDeleteNotificationLEvent);
  }

  void _initializeNotification(
    InitializeNotificationEvent event,
    Emitter emitter,
  ) {
    emit(NotificationInitializeState());
  }

  Future<void> _onGetNotificationDataEvent(
    GetNotificationDataEvent event,
    Emitter emitter,
  ) async {
    add(NotificationLoadingEvent(isLoading: true));
    try {
      final isFromTestEnvironment = AppEnvironment.isTestEnvironment;
      if (!isFromTestEnvironment) {
        await Future.delayed(const Duration(seconds: 3));
      }
      List<NotificationModel> notificationList = [];
      notificationList = List.of(dummyNotifications);
      emit(
        NotificationDataLoadedState(
          state,
          notificationList: notificationList,
        ),
      );
    } catch (e) {
      add(NotificationErrorEvent(msg: e.toString()));
    }
  }

  void _onNotificationLoadingEvent(
    NotificationLoadingEvent event,
    Emitter emitter,
  ) {
    emit(state.copyWith(isLoading: event.isLoading));
  }

  void _onDeleteNotificationLEvent(
    DeleteNotificationEvent event,
    Emitter emitter,
  ) {
    final List<NotificationModel> notificationUpdatedList = List.of(
      state.notificationList,
    );

    notificationUpdatedList.removeWhere(
      (notification) => notification.id == event.notificationId,
    );
    emit(
      NotificationDeletedState(
        state,
        notificationList: notificationUpdatedList,
      ),
    );
  }

  void _onNotificationErrorEvent(
    NotificationErrorEvent event,
    Emitter emitter,
  ) {
    emit(
      NotificationErrorState(
        state,
        message: event.msg,
      ),
    );
  }
}
