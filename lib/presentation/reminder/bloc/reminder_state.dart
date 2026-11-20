import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class ReminderState with Equatable {
  final String title;
  final String description;
  final DateTime selectedDateTime;
  final bool isLoading;
  final String? titleError;
  final String? dateTimeError;

  ReminderState({
    required this.title,
    required this.description,
    required this.selectedDateTime,
    required this.isLoading,
    this.titleError,
    this.dateTimeError,
  });

  ReminderState.initial()
    : title = '',
      description = '',
      selectedDateTime = DateTime.now()
          .add(const Duration(minutes: 1))
          .copyWith(second: 0, millisecond: 0, microsecond: 0),
      isLoading = false,
      titleError = null,
      dateTimeError = null;

  ReminderState.copy(ReminderState state)
    : this(
        title: state.title,
        description: state.description,
        selectedDateTime: state.selectedDateTime,
        isLoading: state.isLoading,
        titleError: state.titleError,
        dateTimeError: state.dateTimeError,
      );

  ReminderState copyWith({
    String? title,
    String? description,
    DateTime? selectedDateTime,
    bool? isLoading,
    String? titleError,
    String? dateTimeError,
  }) {
    return ReminderState(
      title: title ?? this.title,
      description: description ?? this.description,
      selectedDateTime: selectedDateTime ?? this.selectedDateTime,
      isLoading: isLoading ?? this.isLoading,
      titleError: titleError ?? this.titleError,
      dateTimeError: dateTimeError ?? this.dateTimeError,
    );
  }

  @visibleForTesting
  ReminderState.test({
    String? title,
    String? description,
    DateTime? selectedDateTime,
    bool? isLoading,
    this.titleError,
    this.dateTimeError,
  }) : title = title ?? '',
       description = description ?? '',
       selectedDateTime = selectedDateTime ?? DateTime(2025, 1, 1, 12),
       isLoading = isLoading ?? false;

  @override
  List<Object?> get props => [
    title,
    description,
    selectedDateTime,
    isLoading,
    titleError,
    dateTimeError,
  ];
}

class ReminderScheduledState extends ReminderState {
  ReminderScheduledState(super.state) : super.copy();
}

class ReminderSchedulingFailedState extends ReminderState {
  ReminderSchedulingFailedState(super.state) : super.copy();
}

class ReminderFormClearedState extends ReminderState {
  ReminderFormClearedState(super.state) : super.copy();
}
