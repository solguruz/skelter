import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

abstract class ContactUsEvent extends Equatable {
  const ContactUsEvent();

  @override
  List<Object?> get props => [];
}

class NameChangedEvent extends ContactUsEvent {
  final String name;

  const NameChangedEvent({required this.name});

  @override
  List<Object?> get props => [name];
}

class EmailChangedEvent extends ContactUsEvent {
  final String email;

  const EmailChangedEvent({required this.email});

  @override
  List<Object?> get props => [email];
}

class NameErrorEvent extends ContactUsEvent {
  final String error;

  const NameErrorEvent({required this.error});

  @override
  List<Object?> get props => [error];
}

class EmailErrorEvent extends ContactUsEvent {
  final String error;

  const EmailErrorEvent({required this.error});

  @override
  List<Object?> get props => [error];
}

class DescriptionErrorEvent extends ContactUsEvent {
  final String error;

  const DescriptionErrorEvent({required this.error});

  @override
  List<Object?> get props => [error];
}

class DescriptionChangedEvent extends ContactUsEvent {
  final String message;

  const DescriptionChangedEvent({required this.message});

  @override
  List<Object?> get props => [message];
}

class SubmitFormEvent extends ContactUsEvent {
  const SubmitFormEvent();
}

class AddImageEvent extends ContactUsEvent {
  final ImageSource source;

  const AddImageEvent({required this.source});
}

class RemoveImageEvent extends ContactUsEvent {
  final int index;

  const RemoveImageEvent(this.index);
}

class AddPdfEvent extends ContactUsEvent {
  const AddPdfEvent();
}

class RemovePdfEvent extends ContactUsEvent {
  final int index;

  const RemovePdfEvent(this.index);
}
