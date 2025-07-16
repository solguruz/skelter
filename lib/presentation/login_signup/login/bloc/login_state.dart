import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/signup_state.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/screens/phone_num_otp_screen/phone_number_otp_screen.dart';

part 'email_password_login_state.dart';
part 'phone_number_login_state.dart';

class LoginState with EquatableMixin {
  final bool isSignup;
  final PhoneNumberLoginState? phoneNumberLoginState;
  final EmailPasswordLoginState? emailPasswordLoginState;
  final SignUpState? signupState;
  final UserDetailsInputStatus userDetailsInputStatus;
  final bool isLoading;
  final String phoneOTPVerificationId;

  LoginState({
    required this.isSignup,
    required this.phoneNumberLoginState,
    required this.emailPasswordLoginState,
    required this.userDetailsInputStatus,
    required this.signupState,
    required this.phoneOTPVerificationId,
    required this.isLoading,
  });

  LoginState.initial({
    PhoneNumberLoginState? phoneNumberLoginState,
    EmailPasswordLoginState? emailPasswordLoginState,
    SignUpState? signUpState,
  })  : isSignup = false,
        phoneNumberLoginState =
            phoneNumberLoginState ?? PhoneNumberLoginState.initial(),
        emailPasswordLoginState =
            emailPasswordLoginState ?? EmailPasswordLoginState.initial(),
        signupState = signUpState ?? SignUpState.initial(),
        isLoading = false,
        userDetailsInputStatus = UserDetailsInputStatus.none,
        phoneOTPVerificationId = '';

  LoginState.copy(LoginState state)
      : this(
          isSignup: state.isSignup,
          phoneNumberLoginState: state.phoneNumberLoginState,
          emailPasswordLoginState: state.emailPasswordLoginState,
          signupState: state.signupState,
          isLoading: state.isLoading,
          userDetailsInputStatus: state.userDetailsInputStatus,
          phoneOTPVerificationId: state.phoneOTPVerificationId,
        );

  LoginState copyWith({
    bool? isSignup,
    PhoneNumberLoginState? phoneNumberLoginState,
    EmailPasswordLoginState? emailPasswordLoginState,
    SignUpState? signupState,
    bool? isLoading,
    String? verificationId,
    UserDetailsInputStatus? userDetailsInputStatus,
    String? phoneOTPVerificationId,
  }) {
    return LoginState(
      isSignup: isSignup ?? this.isSignup,
      phoneNumberLoginState:
          phoneNumberLoginState ?? this.phoneNumberLoginState,
      emailPasswordLoginState:
          emailPasswordLoginState ?? this.emailPasswordLoginState,
      signupState: signupState ?? this.signupState,
      isLoading: isLoading ?? this.isLoading,
      userDetailsInputStatus:
          userDetailsInputStatus ?? this.userDetailsInputStatus,
      phoneOTPVerificationId:
          phoneOTPVerificationId ?? this.phoneOTPVerificationId,
    );
  }

  @visibleForTesting
  LoginState.test({
    PhoneNumberLoginState? phoneNumberLoginState,
    EmailPasswordLoginState? emailPasswordLoginState,
    SignUpState? signUpState,
    bool? isSignup,
  })  : isSignup = isSignup ?? false,
        phoneNumberLoginState =
            phoneNumberLoginState ?? PhoneNumberLoginState.test(),
        emailPasswordLoginState =
            emailPasswordLoginState ?? EmailPasswordLoginState.test(),
        signupState = signUpState ?? SignUpState.test(),
        isLoading = false,
        userDetailsInputStatus = UserDetailsInputStatus.none,
        phoneOTPVerificationId = '';

  @override
  List<Object?> get props => [
        isSignup,
        phoneNumberLoginState,
        emailPasswordLoginState,
        signupState,
        isLoading,
        userDetailsInputStatus,
        phoneOTPVerificationId,
      ];
}

enum UserDetailsInputStatus {
  none,
  inProgress,
  done,
}

class NavigateToOTPScreenState extends LoginState {
  NavigateToOTPScreenState(
    LoginState state, {
    required String phoneOTPVerificationId,
  }) : super.copy(
          state.copyWith(phoneOTPVerificationId: phoneOTPVerificationId),
        );
}

class NavigateToHomeScreenState extends LoginState {
  NavigateToHomeScreenState(super.state) : super.copy();
}

class AuthenticationExceptionState extends LoginState {
  AuthenticationExceptionState(super.state) : super.copy();
}

class ResetPasswordLinkSentState extends LoginState {
  ResetPasswordLinkSentState(super.state) : super.copy();
}

class PhoneNumLoginLoadingState extends LoginState {
  PhoneNumLoginLoadingState(LoginState state, {required bool isLoading})
      : super.copy(state.copyWith(isLoading: isLoading));
}

class EmailLoginLoadingState extends LoginState {
  EmailLoginLoadingState(LoginState state, {required bool isLoading})
      : super.copy(state.copyWith(isLoading: isLoading));
}

class SSOLoginLoadingState extends LoginState {
  SSOLoginLoadingState(LoginState state, {required bool isLoading})
      : super.copy(state.copyWith(isLoading: isLoading));
}

class NavigateToVerifiedScreenState extends LoginState {
  NavigateToVerifiedScreenState(super.state) : super.copy();
}

class NavigateToChooseHandleState extends LoginState {
  NavigateToChooseHandleState(super.state) : super.copy();
}

class SignupLoadingState extends LoginState {
  SignupLoadingState(LoginState state, {required bool isLoading})
      : super.copy(state.copyWith(isLoading: isLoading));
}

class NavigateToEmailVerifyScreenState extends LoginState {
  NavigateToEmailVerifyScreenState(super.state) : super.copy();
}

class RestartVerificationMailResendTimerState extends LoginState {
  RestartVerificationMailResendTimerState(super.state) : super.copy();
}

class VerificationCodeFailedToSendState extends LoginState {
  VerificationCodeFailedToSendState(super.state) : super.copy();
}

class RegistrationCompletedState extends LoginState {
  RegistrationCompletedState(super.state) : super.copy();
}

class NavigateToCreatePasswordState extends LoginState {
  NavigateToCreatePasswordState(super.state) : super.copy();
}
