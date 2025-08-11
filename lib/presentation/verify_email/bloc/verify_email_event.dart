import 'package:equatable/equatable.dart';
import 'package:flutter_skeleton/presentation/signup/enum/user_details_input_status.dart';

abstract class VerifyEmailEvent extends Equatable {
  const VerifyEmailEvent();
}

class SendEmailVerificationLinkEvent extends VerifyEmailEvent {
  @override
  List<Object?> get props => [];
}

class InitialEvent extends VerifyEmailEvent {
  final String email;
  final bool isSignUp;
  const InitialEvent({required this.email, required this.isSignUp});

  @override
  List<Object?> get props => [email, isSignUp];
}

class RestartVerificationMailResendTimerEvent extends VerifyEmailEvent {
  @override
  List<Object?> get props => [];
}

class VerificationCodeFailedToSendEvent extends VerifyEmailEvent {
  @override
  List<Object?> get props => [];
}

class ChangeUserDetailsInputStatusEvent extends VerifyEmailEvent {
  final UserDetailsInputStatus status;
  const ChangeUserDetailsInputStatusEvent({required this.status});

  @override
  List<Object?> get props => [status];
}

class ResendVerificationEmailTimeLeftEvent extends VerifyEmailEvent {
  final int resendTimeLeft;
  const ResendVerificationEmailTimeLeftEvent({required this.resendTimeLeft});

  @override
  List<Object?> get props => [resendTimeLeft];
}

class NavigateToHomeEvent extends VerifyEmailEvent {
  @override
  List<Object?> get props => [];
}
