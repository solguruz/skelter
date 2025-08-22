import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:skelter/presentation/signup/enum/user_details_input_status.dart';

abstract class SignupEvent with EquatableMixin {
  SignupEvent();
}

class SelectedProfilePictureEvent extends SignupEvent {
  final File image;

  SelectedProfilePictureEvent({required this.image});

  @override
  List<Object?> get props => [image];
}

class RemoveProfilePictureEvent extends SignupEvent {
  RemoveProfilePictureEvent();

  @override
  List<Object?> get props => [];
}

class ProfilePictureDoneToggleEvent extends SignupEvent {
  final bool isDoneEditing;

  ProfilePictureDoneToggleEvent({required this.isDoneEditing});

  @override
  List<Object?> get props => [isDoneEditing];
}

class SignupEmailChangeEvent extends SignupEvent {
  final String email;

  SignupEmailChangeEvent({required this.email});

  @override
  List<Object?> get props => [email];
}

class SignupEmailErrorEvent extends SignupEvent {
  final String errorMessage;

  SignupEmailErrorEvent({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class SignupPasswordChangeEvent extends SignupEvent {
  final String password;

  SignupPasswordChangeEvent({required this.password});

  @override
  List<Object?> get props => [password];
}

class ConfirmPasswordChangeEvent extends SignupEvent {
  final String confirmPassword;

  ConfirmPasswordChangeEvent({required this.confirmPassword});

  @override
  List<Object?> get props => [confirmPassword];
}

class ConfirmPasswordErrorEvent extends SignupEvent {
  final String errorMessage;

  ConfirmPasswordErrorEvent({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class TogglePasswordVisibilityEvent extends SignupEvent {
  final bool isVisible;

  TogglePasswordVisibilityEvent({required this.isVisible});

  @override
  List<Object?> get props => [isVisible];
}

class ToggleConfirmPasswordVisibilityEvent extends SignupEvent {
  final bool isVisible;

  ToggleConfirmPasswordVisibilityEvent({required this.isVisible});

  @override
  List<Object?> get props => [isVisible];
}

class UpdatePasswordStrengthEvent extends SignupEvent {
  final int passwordStrengthLevel;

  UpdatePasswordStrengthEvent({required this.passwordStrengthLevel});

  @override
  List<Object?> get props => [passwordStrengthLevel];
}

class SignupWithEmailEvent extends SignupEvent {
  SignupWithEmailEvent();

  @override
  List<Object?> get props => [];
}

class ResendVerificationEmailTimeLeftEvent extends SignupEvent {
  final int resendTimeLeft;

  ResendVerificationEmailTimeLeftEvent({required this.resendTimeLeft});

  @override
  List<Object?> get props => [resendTimeLeft];
}

class ResetSignUpStateOnScreenClosedEvent extends SignupEvent {
  ResetSignUpStateOnScreenClosedEvent();

  @override
  List<Object?> get props => [];
}

class FinishProfilePictureEvent extends SignupEvent {
  FinishProfilePictureEvent();

  @override
  List<Object?> get props => [];
}

class AuthenticationExceptionEvent extends SignupEvent {
  final String errorMessage;

  AuthenticationExceptionEvent({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class PhoneNumSignUpLoadingEvent extends SignupEvent {
  final bool isLoading;

  PhoneNumSignUpLoadingEvent({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];
}

class EmailSignUpLoadingEvent extends SignupEvent {
  final bool isLoading;

  EmailSignUpLoadingEvent({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];
}

class SendEmailVerificationLinkEvent extends SignupEvent {
  SendEmailVerificationLinkEvent();

  @override
  List<Object?> get props => [];
}

class NavigateToEmailVerifyScreenEvent extends SignupEvent {
  NavigateToEmailVerifyScreenEvent();

  @override
  List<Object?> get props => [];
}

class NavigateToHomeScreenEvent extends SignupEvent {
  NavigateToHomeScreenEvent();

  @override
  List<Object?> get props => [];
}

class CheckEmailAvailabilityEvent extends SignupEvent {
  CheckEmailAvailabilityEvent({required this.email});

  final String email;

  @override
  List<Object?> get props => [email];
}

class ResetPasswordStateEvent extends SignupEvent {
  ResetPasswordStateEvent();

  @override
  List<Object?> get props => [];
}

class ChangeUserDetailsInputStatusEvent extends SignupEvent {
  ChangeUserDetailsInputStatusEvent({required this.status});

  final UserDetailsInputStatus status;

  @override
  List<Object?> get props => [status];
}

class RestartVerificationMailResendTimerEvent extends SignupEvent {
  RestartVerificationMailResendTimerEvent();

  @override
  List<Object?> get props => [];
}
