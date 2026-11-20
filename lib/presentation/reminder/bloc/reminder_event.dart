import 'package:equatable/equatable.dart';

abstract class ReminderEvent with Equatable {
  ReminderEvent();
}

class TitleChangedEvent extends ReminderEvent {
  final String title;

  TitleChangedEvent({required this.title});

  @override
  List<Object?> get props => [title];
}

class DescriptionChangedEvent extends ReminderEvent {
  final String description;

  DescriptionChangedEvent({required this.description});

  @override
  List<Object?> get props => [description];
}

class DateTimeSelectedEvent extends ReminderEvent {
  final DateTime dateTime;

  DateTimeSelectedEvent({required this.dateTime});

  @override
  List<Object?> get props => [dateTime];
}

class ScheduleReminderEvent extends ReminderEvent {
  ScheduleReminderEvent();

  @override
  List<Object?> get props => [];
}

class TitleErrorEvent extends ReminderEvent {
  final String error;

  TitleErrorEvent({required this.error});

  @override
  List<Object?> get props => [error];
}

class DateTimeErrorEvent extends ReminderEvent {
  final String error;

  DateTimeErrorEvent({required this.error});

  @override
  List<Object?> get props => [error];
}

class ClearReminderEvent extends ReminderEvent {
  ClearReminderEvent();

  @override
  List<Object?> get props => [];
}
