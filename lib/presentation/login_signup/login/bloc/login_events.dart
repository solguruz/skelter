import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_skeleton/analytics/analytics_parameters.dart';
import 'package:flutter_skeleton/analytics/main_event.dart';
import 'package:flutter_skeleton/presentation/login_signup/enum_login_type.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_state.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/signup_state.dart';

abstract class LoginEvents with EquatableMixin implements AnalyticsEvent {
  LoginEvents();

  @override
  Map<String, String>? getAnalyticParameters() {
    return {};
  }

  @override
  bool shouldLogEvent() {
    return false;
  }
}

class PhoneInputHasFocus extends LoginEvents {
  final bool hasFocus;

  PhoneInputHasFocus({required this.hasFocus});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kHasFocus: '$hasFocus',
      };

  @override
  List<Object?> get props => [hasFocus];

  @override
  String get eventName => (PhoneInputHasFocus).toString();
}

class IsPhoneNumValidEvent extends LoginEvents {
  final bool isValid;

  IsPhoneNumValidEvent({required this.isValid});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kIsValid: '$isValid',
      };

  @override
  List<Object?> get props => [isValid];

  @override
  String get eventName => (IsPhoneNumValidEvent).toString();
}

class CountryCodeChangeEvent extends LoginEvents {
  final String countryCode;

  CountryCodeChangeEvent({required this.countryCode});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kCountryCode: countryCode,
      };

  @override
  List<Object?> get props => [countryCode];

  @override
  String get eventName => (CountryCodeChangeEvent).toString();
}

class PhoneNumChangeEvent extends LoginEvents {
  final String phoneNumber;

  PhoneNumChangeEvent({required this.phoneNumber});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kPhoneNumber: phoneNumber,
      };

  @override
  List<Object?> get props => [phoneNumber];

  @override
  String get eventName => (PhoneNumChangeEvent).toString();
}

class PhoneNumErrorEvent extends LoginEvents {
  final String errorMessage;

  PhoneNumErrorEvent({required this.errorMessage});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kErrorMessage: errorMessage,
      };

  @override
  List<Object?> get props => [errorMessage];

  @override
  String get eventName => (PhoneNumErrorEvent).toString();
}

class PhoneOtpTextChangeEvent extends LoginEvents {
  final String phoneOtpText;

  PhoneOtpTextChangeEvent({required this.phoneOtpText});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kPhoneOtpText: phoneOtpText,
      };

  @override
  List<Object?> get props => [phoneOtpText];

  @override
  String get eventName => (PhoneOtpTextChangeEvent).toString();
}

class PhoneOtpErrorEvent extends LoginEvents {
  final String errorMessage;

  PhoneOtpErrorEvent({required this.errorMessage});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kErrorMessage: errorMessage,
      };

  @override
  List<Object?> get props => [errorMessage];

  @override
  String get eventName => (PhoneOtpErrorEvent).toString();
}

class IsResendOTPEnabledEvent extends LoginEvents {
  final bool isResendOTPEnabled;

  IsResendOTPEnabledEvent({required this.isResendOTPEnabled});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kIsResendOTPEnabled: '$isResendOTPEnabled',
      };

  @override
  List<Object?> get props => [isResendOTPEnabled];

  @override
  String get eventName => (IsResendOTPEnabledEvent).toString();
}

class ResendOTPTimeLeftEvent extends LoginEvents {
  final int resentOTPTimeLeft;

  ResendOTPTimeLeftEvent({required this.resentOTPTimeLeft});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kResentOTPTimeLeft: '$resentOTPTimeLeft',
      };

  @override
  List<Object?> get props => [resentOTPTimeLeft];

  @override
  String get eventName => (ResendOTPTimeLeftEvent).toString();
}

class NavigateToOtpEvent extends LoginEvents {
  final String verificationId;
  final int? resendToken;

  NavigateToOtpEvent({required this.verificationId, this.resendToken});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kVerificationId: verificationId,
        if (resendToken != null)
          LoginSignupV2AnalyticsParams.kResendToken: '$resendToken',
      };

  @override
  List<Object?> get props => [verificationId, resendToken];

  @override
  String get eventName => (NavigateToOtpEvent).toString();
}

class NavigateToHomeScreenEvent extends LoginEvents {
  NavigateToHomeScreenEvent();

  @override
  Map<String, String>? getAnalyticParameters() => null;

  @override
  List<Object?> get props => [];

  @override
  String get eventName => (NavigateToHomeScreenEvent).toString();
}

class FirebasePhoneLoginEvent extends LoginEvents {
  final bool isFromVerificationPage;

  FirebasePhoneLoginEvent({required this.isFromVerificationPage});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kIsFromVerificationPage:
            '$isFromVerificationPage',
      };

  @override
  List<Object?> get props => [isFromVerificationPage];

  @override
  String get eventName => (FirebasePhoneLoginEvent).toString();
}

class FirebaseOTPVerificationEvent extends LoginEvents {
  FirebaseOTPVerificationEvent();

  @override
  Map<String, String>? getAnalyticParameters() => null;

  @override
  List<Object?> get props => [];

  @override
  String get eventName => (FirebaseOTPVerificationEvent).toString();
}

class FirebaseOTPAutoVerificationEvent extends LoginEvents {
  final String otpCode;

  FirebaseOTPAutoVerificationEvent({required this.otpCode});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kOtpCode: otpCode,
      };

  @override
  List<Object?> get props => [otpCode];

  @override
  String get eventName => (FirebaseOTPAutoVerificationEvent).toString();
}

class EmailChangeEvent extends LoginEvents {
  final String email;

  EmailChangeEvent({required this.email});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kEmail: email,
      };

  @override
  List<Object?> get props => [email];

  @override
  String get eventName => (EmailChangeEvent).toString();
}

class EmailErrorEvent extends LoginEvents {
  final String errorMessage;

  EmailErrorEvent({required this.errorMessage});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kErrorMessage: errorMessage,
      };

  @override
  List<Object?> get props => [errorMessage];

  @override
  String get eventName => (EmailErrorEvent).toString();
}

class PasswordChangeEvent extends LoginEvents {
  final String password;

  PasswordChangeEvent({required this.password});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kPassword: password,
      };

  @override
  List<Object?> get props => [password];

  @override
  String get eventName => (PasswordChangeEvent).toString();
}

class PasswordErrorEvent extends LoginEvents {
  final String errorMessage;

  PasswordErrorEvent({required this.errorMessage});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kErrorMessage: errorMessage,
      };

  @override
  List<Object?> get props => [errorMessage];

  @override
  String get eventName => (PasswordErrorEvent).toString();
}

class IsPasswordVisibleEvent extends LoginEvents {
  final bool isPasswordVisible;

  IsPasswordVisibleEvent({required this.isPasswordVisible});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kIsPasswordVisible: '$isPasswordVisible',
      };

  @override
  List<Object?> get props => [isPasswordVisible];

  @override
  String get eventName => (IsPasswordVisibleEvent).toString();
}

class EmailPasswordLoginEvent extends LoginEvents {
  EmailPasswordLoginEvent();

  @override
  Map<String, String>? getAnalyticParameters() => null;

  @override
  List<Object?> get props => [];

  @override
  String get eventName => (EmailPasswordLoginEvent).toString();
}

class AuthenticationExceptionEvent extends LoginEvents {
  final String errorMessage;

  AuthenticationExceptionEvent({required this.errorMessage});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kErrorMessage: errorMessage,
      };

  @override
  List<Object?> get props => [errorMessage];

  @override
  String get eventName => (AuthenticationExceptionEvent).toString();
}

class CompleteOnboardingEvent extends LoginEvents {
  CompleteOnboardingEvent();

  @override
  Map<String, String>? getAnalyticParameters() => null;

  @override
  List<Object?> get props => [];

  @override
  String get eventName => (CompleteOnboardingEvent).toString();
}

class ForgotPasswordEvent extends LoginEvents {
  ForgotPasswordEvent();

  @override
  Map<String, String>? getAnalyticParameters() => null;

  @override
  List<Object?> get props => [];

  @override
  String get eventName => (ForgotPasswordEvent).toString();
}

class ResetPasswordLinkSentEvent extends LoginEvents {
  ResetPasswordLinkSentEvent();

  @override
  Map<String, String>? getAnalyticParameters() => null;

  @override
  List<Object?> get props => [];

  @override
  String get eventName => (ResetPasswordLinkSentEvent).toString();
}

class LoginWithGoogleEvent extends LoginEvents {
  LoginWithGoogleEvent();

  @override
  Map<String, String>? getAnalyticParameters() => null;

  @override
  List<Object?> get props => [];

  @override
  String get eventName => (LoginWithGoogleEvent).toString();
}

class LoginWithAppleEvent extends LoginEvents {
  LoginWithAppleEvent();

  @override
  Map<String, String>? getAnalyticParameters() => null;

  @override
  List<Object?> get props => [];

  @override
  String get eventName => (LoginWithAppleEvent).toString();
}

class SSOLoginLoadingEvent extends LoginEvents {
  final bool isLoading;

  SSOLoginLoadingEvent({required this.isLoading});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kIsLoading: '$isLoading',
      };

  @override
  List<Object?> get props => [isLoading];

  @override
  String get eventName => (SSOLoginLoadingEvent).toString();
}

class LoginWithPhoneNumEvent extends LoginEvents {
  final String phoneNumberWithCode;

  LoginWithPhoneNumEvent(this.phoneNumberWithCode);

  @override
  List<Object?> get props => [phoneNumberWithCode];

  @override
  String get eventName => (LoginWithPhoneNumEvent).toString();
}

class PhoneNumLoginLoadingEvent extends LoginEvents {
  final bool isLoading;

  PhoneNumLoginLoadingEvent({required this.isLoading});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kIsLoading: '$isLoading',
      };

  @override
  List<Object?> get props => [isLoading];

  @override
  String get eventName => (PhoneNumLoginLoadingEvent).toString();
}

class EmailLoginLoadingEvent extends LoginEvents {
  final bool isLoading;

  EmailLoginLoadingEvent({required this.isLoading});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kIsLoading: '$isLoading',
      };

  @override
  List<Object?> get props => [isLoading];

  @override
  String get eventName => (EmailLoginLoadingEvent).toString();
}

class ResetEmailStateEvent extends LoginEvents {
  ResetEmailStateEvent();

  @override
  Map<String, String>? getAnalyticParameters() => null;

  @override
  List<Object?> get props => [];

  @override
  String get eventName => (ResetEmailStateEvent).toString();
}

class ResetPhoneNumberStateEvent extends LoginEvents {
  ResetPhoneNumberStateEvent();

  @override
  Map<String, String>? getAnalyticParameters() => null;

  @override
  List<Object?> get props => [];

  @override
  String get eventName => (ResetPhoneNumberStateEvent).toString();
}

class EnableSignupModeEvent extends LoginEvents {
  final bool isSignup;

  EnableSignupModeEvent({required this.isSignup});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kIsSignup: '$isSignup',
      };

  @override
  List<Object?> get props => [isSignup];

  @override
  String get eventName => (EnableSignupModeEvent).toString();
}

class NavigateToVerifiedScreenEvent extends LoginEvents {
  NavigateToVerifiedScreenEvent();

  @override
  Map<String, String>? getAnalyticParameters() => null;

  @override
  List<Object?> get props => [];

  @override
  String get eventName => (NavigateToVerifiedScreenEvent).toString();
}

class NavigateToChooseHandleScreenEvent extends LoginEvents {
  NavigateToChooseHandleScreenEvent();

  @override
  Map<String, String>? getAnalyticParameters() => null;

  @override
  List<Object?> get props => [];

  @override
  String get eventName => (NavigateToChooseHandleScreenEvent).toString();
}

class HandleNameChangeEvent extends LoginEvents {
  final String handleName;

  HandleNameChangeEvent({required this.handleName});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kHandleName: handleName,
      };

  @override
  List<Object?> get props => [handleName];

  @override
  String get eventName => (HandleNameChangeEvent).toString();
}

class HandleNameErrorEvent extends LoginEvents {
  final String errorMessage;

  HandleNameErrorEvent({required this.errorMessage});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kErrorMessage: errorMessage,
      };

  @override
  List<Object?> get props => [errorMessage];

  @override
  String get eventName => (HandleNameErrorEvent).toString();
}

class HandleNameStatusEvent extends LoginEvents {
  final HandleNameStatus status;

  HandleNameStatusEvent({required this.status});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kHandleNameStatus: '$status',
      };

  @override
  List<Object?> get props => [status];

  @override
  String get eventName => (HandleNameStatusEvent).toString();
}

class HandleInputSuffixVisibilityEvent extends LoginEvents {
  final bool showSuffix;

  HandleInputSuffixVisibilityEvent({required this.showSuffix});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kShowSuffix: '$showSuffix',
      };

  @override
  List<Object?> get props => [showSuffix];

  @override
  String get eventName => (HandleInputSuffixVisibilityEvent).toString();
}

class SignupLoadingEvent extends LoginEvents {
  final bool isLoading;

  SignupLoadingEvent({required this.isLoading});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kIsLoading: '$isLoading',
      };

  @override
  List<Object?> get props => [isLoading];

  @override
  String get eventName => (SignupLoadingEvent).toString();
}

class ProfilePictureDoneToggleEvent extends LoginEvents {
  final bool isDoneEditing;

  ProfilePictureDoneToggleEvent({required this.isDoneEditing});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kIsDoneEditing: '$isDoneEditing',
      };

  @override
  List<Object?> get props => [isDoneEditing];

  @override
  String get eventName => (ProfilePictureDoneToggleEvent).toString();
}

class SelectedProfilePictureEvent extends LoginEvents {
  final File image;

  SelectedProfilePictureEvent({required this.image});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kProfilePicturePath: image.path,
      };

  @override
  List<Object?> get props => [image];

  @override
  String get eventName => (SelectedProfilePictureEvent).toString();
}

class RemoveProfilePictureEvent extends LoginEvents {
  RemoveProfilePictureEvent();

  @override
  Map<String, String>? getAnalyticParameters() => null;

  @override
  List<Object?> get props => [];

  @override
  String get eventName => (RemoveProfilePictureEvent).toString();
}

class FinishProfilePictureEvent extends LoginEvents {
  FinishProfilePictureEvent();

  @override
  Map<String, String>? getAnalyticParameters() => null;

  @override
  List<Object?> get props => [];

  @override
  String get eventName => (FinishProfilePictureEvent).toString();
}

class ResetSignUpStateOnPageClosedEvent extends LoginEvents {
  ResetSignUpStateOnPageClosedEvent();

  @override
  Map<String, String>? getAnalyticParameters() => null;

  @override
  List<Object?> get props => [];

  @override
  String get eventName => (ResetSignUpStateOnPageClosedEvent).toString();
}

class SelectLoginSignupTypeEvent extends LoginEvents {
  final LoginType selectedType;

  SelectLoginSignupTypeEvent(this.selectedType);

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kLoginSignupType: '$selectedType',
      };

  @override
  List<Object?> get props => [selectedType];

  @override
  String get eventName => (SelectLoginSignupTypeEvent).toString();
}

class SignupEmailChangeEvent extends LoginEvents {
  final String email;

  SignupEmailChangeEvent({required this.email});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kEmail: email,
      };

  @override
  List<Object?> get props => [email];

  @override
  String get eventName => (SignupEmailChangeEvent).toString();
}

class SignupEmailErrorEvent extends LoginEvents {
  final String errorMessage;

  SignupEmailErrorEvent({required this.errorMessage});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kErrorMessage: errorMessage,
      };

  @override
  List<Object?> get props => [errorMessage];

  @override
  String get eventName => (SignupEmailErrorEvent).toString();
}

class SignupPasswordChangeEvent extends LoginEvents {
  final String password;

  SignupPasswordChangeEvent({required this.password});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kPassword: password,
      };

  @override
  List<Object?> get props => [password];

  @override
  String get eventName => (SignupPasswordChangeEvent).toString();
}

class ConfirmPasswordChangeEvent extends LoginEvents {
  final String confirmPassword;

  ConfirmPasswordChangeEvent({required this.confirmPassword});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kConfirmPassword: confirmPassword,
      };

  @override
  List<Object?> get props => [confirmPassword];

  @override
  String get eventName => (ConfirmPasswordChangeEvent).toString();
}

class ConfirmPasswordErrorEvent extends LoginEvents {
  final String errorMessage;

  ConfirmPasswordErrorEvent({required this.errorMessage});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kErrorMessage: errorMessage,
      };

  @override
  List<Object?> get props => [errorMessage];

  @override
  String get eventName => (ConfirmPasswordErrorEvent).toString();
}

class TogglePasswordVisibilityEvent extends LoginEvents {
  final bool isVisible;

  TogglePasswordVisibilityEvent({required this.isVisible});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kIsPasswordVisible: '$isVisible',
      };

  @override
  List<Object?> get props => [isVisible];

  @override
  String get eventName => (TogglePasswordVisibilityEvent).toString();
}

class ToggleConfirmPasswordVisibilityEvent extends LoginEvents {
  final bool isVisible;

  ToggleConfirmPasswordVisibilityEvent({required this.isVisible});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kIsConfirmPasswordVisible: '$isVisible',
      };

  @override
  List<Object?> get props => [isVisible];

  @override
  String get eventName => (ToggleConfirmPasswordVisibilityEvent).toString();
}

class UpdatePasswordStrengthEvent extends LoginEvents {
  final int passwordStrengthLevel;

  UpdatePasswordStrengthEvent({required this.passwordStrengthLevel});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kPasswordStrengthLevel:
            '$passwordStrengthLevel',
      };

  @override
  List<Object?> get props => [passwordStrengthLevel];

  @override
  String get eventName => (UpdatePasswordStrengthEvent).toString();
}

class SignupWithEmailEvent extends LoginEvents {
  SignupWithEmailEvent();

  @override
  Map<String, String>? getAnalyticParameters() => null;

  @override
  List<Object?> get props => [];

  @override
  String get eventName => (SignupWithEmailEvent).toString();
}

class NavigateToEmailVerifyPageEvent extends LoginEvents {
  NavigateToEmailVerifyPageEvent();

  @override
  Map<String, String>? getAnalyticParameters() => null;

  @override
  List<Object?> get props => [];

  @override
  String get eventName => (NavigateToEmailVerifyPageEvent).toString();
}

class SendEmailVerificationLinkEvent extends LoginEvents {
  SendEmailVerificationLinkEvent();

  @override
  Map<String, String>? getAnalyticParameters() => null;

  @override
  List<Object?> get props => [];

  @override
  String get eventName => (SendEmailVerificationLinkEvent).toString();
}

class ResendVerificationEmailTimeLeftEvent extends LoginEvents {
  final int resendTimeLeft;

  ResendVerificationEmailTimeLeftEvent({required this.resendTimeLeft});

  @override
  Map<String, String>? getAnalyticParameters() => {
        LoginSignupV2AnalyticsParams.kResendTimeLeft: '$resendTimeLeft',
      };

  @override
  List<Object?> get props => [resendTimeLeft];

  @override
  String get eventName => (ResendVerificationEmailTimeLeftEvent).toString();
}

class RestartVerificationMailResendTimerEvent extends LoginEvents {
  RestartVerificationMailResendTimerEvent();

  @override
  Map<String, String>? getAnalyticParameters() => null;

  @override
  List<Object?> get props => [];

  @override
  String get eventName => (RestartVerificationMailResendTimerEvent).toString();
}

class VerificationCodeFailedToSendEvent extends LoginEvents {
  VerificationCodeFailedToSendEvent();

  @override
  Map<String, String>? getAnalyticParameters() => null;

  @override
  List<Object?> get props => [];

  @override
  String get eventName => (VerificationCodeFailedToSendEvent).toString();
}

class CheckEmailAvailabilityEvent extends LoginEvents {
  CheckEmailAvailabilityEvent(this.email);

  final String email;

  @override
  Map<String, String>? getAnalyticParameters() => null;

  @override
  List<Object?> get props => [email];

  @override
  String get eventName => (CheckEmailAvailabilityEvent).toString();
}

class ChangeUserDetailsInputStatusEvent extends LoginEvents {
  ChangeUserDetailsInputStatusEvent(this.status);

  final UserDetailsInputStatus status;

  @override
  Map<String, String>? getAnalyticParameters() => null;

  @override
  List<Object?> get props => [status];

  @override
  String get eventName => (ChangeUserDetailsInputStatusEvent).toString();
}
