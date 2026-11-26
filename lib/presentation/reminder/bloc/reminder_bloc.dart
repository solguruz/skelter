import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/i18n/app_localizations.dart';
import 'package:skelter/presentation/reminder/bloc/reminder_event.dart';
import 'package:skelter/presentation/reminder/bloc/reminder_state.dart';
import 'package:skelter/presentation/reminder/model/reminder_model.dart';
import 'package:skelter/services/notification_service.dart';

class ReminderBloc extends Bloc<ReminderEvent, ReminderState> {
  final NotificationService _notificationService;
  final AppLocalizations _localizations;

  ReminderBloc({required this._localizations})
    : _notificationService = NotificationService.instance,
      super(ReminderState.initial()) {
    _setupEventListeners();
  }

  void _setupEventListeners() {
    on<TitleChangedEvent>(_onTitleChangedEvent);
    on<DescriptionChangedEvent>(_onDescriptionChangedEvent);
    on<DateTimeSelectedEvent>(_onDateTimeSelectedEvent);
    on<ScheduleReminderEvent>(_onScheduleReminderEvent);
    on<TitleErrorEvent>(_onTitleErrorEvent);
    on<DateTimeErrorEvent>(_onDateTimeErrorEvent);
    on<ClearReminderEvent>(_onClearReminderEvent);
  }

  void _onTitleChangedEvent(
    TitleChangedEvent event,
    Emitter<ReminderState> emit,
  ) {
    emit(state.copyWith(title: event.title));
  }

  void _onDescriptionChangedEvent(
    DescriptionChangedEvent event,
    Emitter<ReminderState> emit,
  ) {
    emit(state.copyWith(description: event.description));
  }

  void _onDateTimeSelectedEvent(
    DateTimeSelectedEvent event,
    Emitter<ReminderState> emit,
  ) {
    emit(state.copyWith(selectedDateTime: event.dateTime));
  }

  void _onTitleErrorEvent(TitleErrorEvent event, Emitter<ReminderState> emit) {
    emit(state.copyWith(titleError: event.error));
  }

  void _onDateTimeErrorEvent(
    DateTimeErrorEvent event,
    Emitter<ReminderState> emit,
  ) {
    emit(state.copyWith(dateTimeError: event.error));
  }

  Future<void> _onScheduleReminderEvent(
    ScheduleReminderEvent event,
    Emitter<ReminderState> emit,
  ) async {
    if (state.title.isEmpty) {
      emit(state.copyWith(titleError: _localizations.reminder_title_required));
      return;
    }

    if (state.selectedDateTime.isBefore(DateTime.now())) {
      emit(
        state.copyWith(
          dateTimeError: _localizations.reminder_future_date_required,
        ),
      );
      return;
    }

    emit(state.copyWith(isLoading: true));

    try {
      final reminder = ReminderModel(
        id: DateTime.now().millisecondsSinceEpoch,
        title: state.title,
        description: state.description,
        scheduledDateTime: state.selectedDateTime,
      );

      final success = await _notificationService.scheduleReminder(reminder);

      if (success) {
        emit(ReminderScheduledState(ReminderState.initial()));
      } else {
        emit(ReminderSchedulingFailedState(state.copyWith(isLoading: false)));
      }
    } catch (e) {
      debugPrint('Error scheduling reminder: $e');
      emit(ReminderSchedulingFailedState(state.copyWith(isLoading: false)));
    }
  }

  void _onClearReminderEvent(
    ClearReminderEvent event,
    Emitter<ReminderState> emit,
  ) {
    emit(ReminderFormClearedState(state));
  }
}
