import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_skeleton/presentation/login_signup/enum_login_type.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_state.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/signup_state.dart';

abstract class LoginEvents with EquatableMixin {
  LoginEvents();
}

class PhoneInputHasFocus extends LoginEvents {
  final bool hasFocus;

  PhoneInputHasFocus({required this.hasFocus});

  @override
  List<Object?> get props => [hasFocus];
}

class IsPhoneNumValidEvent extends LoginEvents {
  final bool isValid;

  IsPhoneNumValidEvent({required this.isValid});

  @override
  List<Object?> get props => [isValid];
}

class CountryCodeChangeEvent extends LoginEvents {
  final String countryCode;

  CountryCodeChangeEvent({required this.countryCode});

  @override
  List<Object?> get props => [countryCode];
}

class PhoneNumChangeEvent extends LoginEvents {
  final String phoneNumber;

  PhoneNumChangeEvent({required this.phoneNumber});

  @override
  List<Object?> get props => [phoneNumber];
}

class PhoneNumErrorEvent extends LoginEvents {
  final String errorMessage;

  PhoneNumErrorEvent({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class PhoneOtpTextChangeEvent extends LoginEvents {
  final String phoneOtpText;

  PhoneOtpTextChangeEvent({required this.phoneOtpText});

  @override
  List<Object?> get props => [phoneOtpText];
}

class PhoneOtpErrorEvent extends LoginEvents {
  final String errorMessage;

  PhoneOtpErrorEvent({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class IsResendOTPEnabledEvent extends LoginEvents {
  final bool isResendOTPEnabled;

  IsResendOTPEnabledEvent({required this.isResendOTPEnabled});

  @override
  List<Object?> get props => [isResendOTPEnabled];
}

class ResendOTPTimeLeftEvent extends LoginEvents {
  final int resentOTPTimeLeft;

  ResendOTPTimeLeftEvent({required this.resentOTPTimeLeft});

  @override
  List<Object?> get props => [resentOTPTimeLeft];
}

class NavigateToOtpEvent extends LoginEvents {
  final String verificationId;
  final int? resendToken;

  NavigateToOtpEvent({required this.verificationId, this.resendToken});

  @override
  List<Object?> get props => [verificationId, resendToken];
}

class NavigateToHomeScreenEvent extends LoginEvents {
  NavigateToHomeScreenEvent();

  @override
  List<Object?> get props => [];
}

class FirebasePhoneLoginEvent extends LoginEvents {
  final bool isFromVerificationScreen;

  FirebasePhoneLoginEvent({required this.isFromVerificationScreen});

  @override
  List<Object?> get props => [isFromVerificationScreen];
}

class FirebaseOTPVerificationEvent extends LoginEvents {
  FirebaseOTPVerificationEvent();

  @override
  List<Object?> get props => [];
}

class FirebaseOTPAutoVerificationEvent extends LoginEvents {
  final String otpCode;

  FirebaseOTPAutoVerificationEvent({required this.otpCode});

  @override
  List<Object?> get props => [otpCode];
}

class EmailChangeEvent extends LoginEvents {
  final String email;

  EmailChangeEvent({required this.email});

  @override
  List<Object?> get props => [email];
}

class EmailErrorEvent extends LoginEvents {
  final String errorMessage;

  EmailErrorEvent({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class PasswordChangeEvent extends LoginEvents {
  final String password;

  PasswordChangeEvent({required this.password});

  @override
  List<Object?> get props => [password];
}

class PasswordErrorEvent extends LoginEvents {
  final String errorMessage;

  PasswordErrorEvent({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class IsPasswordVisibleEvent extends LoginEvents {
  final bool isPasswordVisible;

  IsPasswordVisibleEvent({required this.isPasswordVisible});

  @override
  List<Object?> get props => [isPasswordVisible];
}

class EmailPasswordLoginEvent extends LoginEvents {
  EmailPasswordLoginEvent();

  @override
  List<Object?> get props => [];
}

class AuthenticationExceptionEvent extends LoginEvents {
  final String errorMessage;

  AuthenticationExceptionEvent({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class CompleteOnboardingEvent extends LoginEvents {
  CompleteOnboardingEvent();

  @override
  List<Object?> get props => [];
}

class ForgotPasswordEvent extends LoginEvents {
  ForgotPasswordEvent();

  @override
  List<Object?> get props => [];
}

class ResetPasswordLinkSentEvent extends LoginEvents {
  ResetPasswordLinkSentEvent();

  @override
  List<Object?> get props => [];
}

class LoginWithGoogleEvent extends LoginEvents {
  LoginWithGoogleEvent();

  @override
  List<Object?> get props => [];
}

class LoginWithAppleEvent extends LoginEvents {
  LoginWithAppleEvent();

  @override
  List<Object?> get props => [];
}

class SSOLoginLoadingEvent extends LoginEvents {
  final bool isLoading;

  SSOLoginLoadingEvent({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];
}

class LoginWithPhoneNumEvent extends LoginEvents {
  final String phoneNumberWithCode;

  LoginWithPhoneNumEvent(this.phoneNumberWithCode);

  @override
  List<Object?> get props => [phoneNumberWithCode];
}

class PhoneNumLoginLoadingEvent extends LoginEvents {
  final bool isLoading;

  PhoneNumLoginLoadingEvent({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];
}

class EmailLoginLoadingEvent extends LoginEvents {
  final bool isLoading;

  EmailLoginLoadingEvent({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];
}

class ResetEmailStateEvent extends LoginEvents {
  ResetEmailStateEvent();

  @override
  List<Object?> get props => [];
}

class ResetPhoneNumberStateEvent extends LoginEvents {
  ResetPhoneNumberStateEvent();

  @override
  List<Object?> get props => [];
}

class EnableSignupModeEvent extends LoginEvents {
  final bool isSignup;

  EnableSignupModeEvent({required this.isSignup});

  @override
  List<Object?> get props => [isSignup];
}

class NavigateToVerifiedScreenEvent extends LoginEvents {
  NavigateToVerifiedScreenEvent();

  @override
  List<Object?> get props => [];
}

class NavigateToChooseHandleScreenEvent extends LoginEvents {
  NavigateToChooseHandleScreenEvent();

  @override
  List<Object?> get props => [];
}

class HandleNameChangeEvent extends LoginEvents {
  final String handleName;

  HandleNameChangeEvent({required this.handleName});

  @override
  List<Object?> get props => [handleName];
}

class HandleNameErrorEvent extends LoginEvents {
  final String errorMessage;

  HandleNameErrorEvent({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class HandleNameStatusEvent extends LoginEvents {
  final HandleNameStatus status;

  HandleNameStatusEvent({required this.status});

  @override
  List<Object?> get props => [status];
}

class HandleInputSuffixVisibilityEvent extends LoginEvents {
  final bool showSuffix;

  HandleInputSuffixVisibilityEvent({required this.showSuffix});

  @override
  List<Object?> get props => [showSuffix];
}

class SignupLoadingEvent extends LoginEvents {
  final bool isLoading;

  SignupLoadingEvent({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];
}

class ProfilePictureDoneToggleEvent extends LoginEvents {
  final bool isDoneEditing;

  ProfilePictureDoneToggleEvent({required this.isDoneEditing});

  @override
  List<Object?> get props => [isDoneEditing];
}

class SelectedProfilePictureEvent extends LoginEvents {
  final File image;

  SelectedProfilePictureEvent({required this.image});

  @override
  List<Object?> get props => [image];
}

class RemoveProfilePictureEvent extends LoginEvents {
  RemoveProfilePictureEvent();

  @override
  List<Object?> get props => [];
}

class FinishProfilePictureEvent extends LoginEvents {
  FinishProfilePictureEvent();

  @override
  List<Object?> get props => [];
}

class ResetSignUpStateOnScreenClosedEvent extends LoginEvents {
  ResetSignUpStateOnScreenClosedEvent();

  @override
  List<Object?> get props => [];
}

class SelectLoginSignupTypeEvent extends LoginEvents {
  final LoginType selectedType;

  SelectLoginSignupTypeEvent(this.selectedType);

  @override
  List<Object?> get props => [selectedType];
}

class SignupEmailChangeEvent extends LoginEvents {
  final String email;

  SignupEmailChangeEvent({required this.email});

  @override
  List<Object?> get props => [email];
}

class SignupEmailErrorEvent extends LoginEvents {
  final String errorMessage;

  SignupEmailErrorEvent({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class SignupPasswordChangeEvent extends LoginEvents {
  final String password;

  SignupPasswordChangeEvent({required this.password});

  @override
  List<Object?> get props => [password];
}

class ConfirmPasswordChangeEvent extends LoginEvents {
  final String confirmPassword;

  ConfirmPasswordChangeEvent({required this.confirmPassword});

  @override
  List<Object?> get props => [confirmPassword];
}

class ConfirmPasswordErrorEvent extends LoginEvents {
  final String errorMessage;

  ConfirmPasswordErrorEvent({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class TogglePasswordVisibilityEvent extends LoginEvents {
  final bool isVisible;

  TogglePasswordVisibilityEvent({required this.isVisible});

  @override
  List<Object?> get props => [isVisible];
}

class ToggleConfirmPasswordVisibilityEvent extends LoginEvents {
  final bool isVisible;

  ToggleConfirmPasswordVisibilityEvent({required this.isVisible});

  @override
  List<Object?> get props => [isVisible];
}

class UpdatePasswordStrengthEvent extends LoginEvents {
  final int passwordStrengthLevel;

  UpdatePasswordStrengthEvent({required this.passwordStrengthLevel});

  @override
  List<Object?> get props => [passwordStrengthLevel];
}

class SignupWithEmailEvent extends LoginEvents {
  SignupWithEmailEvent();

  @override
  List<Object?> get props => [];
}

class NavigateToEmailVerifyScreenEvent extends LoginEvents {
  NavigateToEmailVerifyScreenEvent();

  @override
  List<Object?> get props => [];
}

class SendEmailVerificationLinkEvent extends LoginEvents {
  SendEmailVerificationLinkEvent();

  @override
  List<Object?> get props => [];
}

class ResendVerificationEmailTimeLeftEvent extends LoginEvents {
  final int resendTimeLeft;

  ResendVerificationEmailTimeLeftEvent({required this.resendTimeLeft});

  @override
  List<Object?> get props => [resendTimeLeft];
}

class RestartVerificationMailResendTimerEvent extends LoginEvents {
  RestartVerificationMailResendTimerEvent();

  @override
  List<Object?> get props => [];
}

class VerificationCodeFailedToSendEvent extends LoginEvents {
  VerificationCodeFailedToSendEvent();

  @override
  List<Object?> get props => [];
}

class CheckEmailAvailabilityEvent extends LoginEvents {
  CheckEmailAvailabilityEvent(this.email);

  final String email;

  @override
  List<Object?> get props => [email];
}

class ChangeUserDetailsInputStatusEvent extends LoginEvents {
  ChangeUserDetailsInputStatusEvent(this.status);

  final UserDetailsInputStatus status;

  @override
  List<Object?> get props => [status];
}
