import 'package:equatable/equatable.dart';
import 'package:flutter_skeleton/presentation/delete_account/enum/delete_account_reasons.dart';

abstract class DeleteAccountEvent with EquatableMixin {
  const DeleteAccountEvent();
}

class DeleteReasonSelectedEvent extends DeleteAccountEvent {
  final DeleteAccountReasons reason;

  const DeleteReasonSelectedEvent({required this.reason});

  @override
  List<Object?> get props => [reason];
}

class DeleteOtherReasonTextChangedEvent extends DeleteAccountEvent {
  final String text;

  const DeleteOtherReasonTextChangedEvent({required this.text});

  @override
  List<Object?> get props => [text];
}

class DeleteAccountSubmittedEvent extends DeleteAccountEvent {
  const DeleteAccountSubmittedEvent();

  @override
  List<Object?> get props => [];
}
