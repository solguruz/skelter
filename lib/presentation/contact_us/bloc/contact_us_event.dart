import 'package:equatable/equatable.dart';
import 'package:flutter_skeleton/analytics/main_event.dart';
import 'package:image_picker/image_picker.dart';

abstract class ContactUsEvent extends Equatable implements AnalyticsEvent {
  const ContactUsEvent();

  @override
  Map<String, String>? getAnalyticParameters() => {};

  @override
  bool shouldLogEvent() => false;

  @override
  List<Object?> get props => [];
}

class NameChangedEvent extends ContactUsEvent {
  final String name;

  const NameChangedEvent({required this.name});

  @override
  List<Object?> get props => [name];

  @override
  String get eventName => (NameChangedEvent).toString();
}

class EmailChangedEvent extends ContactUsEvent {
  final String email;

  const EmailChangedEvent({required this.email});

  @override
  List<Object?> get props => [email];

  @override
  String get eventName => (EmailChangedEvent).toString();
}

class NameErrorEvent extends ContactUsEvent {
  final String error;

  const NameErrorEvent({required this.error});

  @override
  List<Object?> get props => [error];

  @override
  String get eventName => (NameErrorEvent).toString();
}

class EmailErrorEvent extends ContactUsEvent {
  final String error;

  const EmailErrorEvent({required this.error});

  @override
  List<Object?> get props => [error];

  @override
  String get eventName => (EmailErrorEvent).toString();
}

class DescriptionErrorEvent extends ContactUsEvent {
  final String error;

  const DescriptionErrorEvent({required this.error});

  @override
  List<Object?> get props => [error];

  @override
  String get eventName => (DescriptionErrorEvent).toString();
}

class DescriptionChangedEvent extends ContactUsEvent {
  final String message;

  const DescriptionChangedEvent({required this.message});

  @override
  List<Object?> get props => [message];

  @override
  String get eventName => (DescriptionChangedEvent).toString();
}

class SubmitFormEvent extends ContactUsEvent {
  const SubmitFormEvent();

  @override
  String get eventName => (SubmitFormEvent).toString();
}

class AddImageEvent extends ContactUsEvent {
  final ImageSource source;

  const AddImageEvent({required this.source});

  @override
  String get eventName => (AddImageEvent).toString();
}

class RemoveImageEvent extends ContactUsEvent {
  final int index;

  const RemoveImageEvent(this.index);

  @override
  String get eventName => (RemoveImageEvent).toString();
}

class AddPdfEvent extends ContactUsEvent {
  const AddPdfEvent();

  @override
  String get eventName => (AddPdfEvent).toString();
}

class RemovePdfEvent extends ContactUsEvent {
  final int index;

  const RemovePdfEvent(this.index);

  @override
  String get eventName => (RemovePdfEvent).toString();
}
