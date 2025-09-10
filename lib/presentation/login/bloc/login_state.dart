import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:skelter/presentation/login/enum/enum_login_type.dart';
import 'package:skelter/presentation/login/screens/phone_num_otp_screen/phone_number_otp_screen.dart';
import 'package:skelter/presentation/signup/enum/user_details_input_status.dart';

part 'email_password_login_state.dart';
part 'phone_number_login_state.dart';

class LoginState with EquatableMixin {
  final bool isSignup;
  final PhoneNumberLoginState? phoneNumberLoginState;
  final EmailPasswordLoginState? emailPasswordLoginState;
  final UserDetailsInputStatus userDetailsInputStatus;
  final bool isLoading;
  final String phoneOTPVerificationId;
  final LoginType selectedLoginType;

  LoginState({
    required this.isSignup,
    required this.phoneNumberLoginState,
    required this.emailPasswordLoginState,
    required this.userDetailsInputStatus,
    required this.phoneOTPVerificationId,
    required this.isLoading,
    required this.selectedLoginType,
  });

  LoginState.initial({
    PhoneNumberLoginState? phoneNumberLoginState,
    EmailPasswordLoginState? emailPasswordLoginState,
  })  : isSignup = false,
        phoneNumberLoginState =
            phoneNumberLoginState ?? PhoneNumberLoginState.initial(),
        emailPasswordLoginState =
            emailPasswordLoginState ?? EmailPasswordLoginState.initial(),
        isLoading = false,
        userDetailsInputStatus = UserDetailsInputStatus.none,
        phoneOTPVerificationId = '',
        selectedLoginType = LoginType.PHONE;

  LoginState.copy(LoginState state)
      : this(
          isSignup: state.isSignup,
          phoneNumberLoginState: state.phoneNumberLoginState,
          emailPasswordLoginState: state.emailPasswordLoginState,
          isLoading: state.isLoading,
          userDetailsInputStatus: state.userDetailsInputStatus,
          phoneOTPVerificationId: state.phoneOTPVerificationId,
          selectedLoginType: state.selectedLoginType,
        );

  LoginState copyWith({
    bool? isSignup,
    PhoneNumberLoginState? phoneNumberLoginState,
    EmailPasswordLoginState? emailPasswordLoginState,
    bool? isLoading,
    String? verificationId,
    UserDetailsInputStatus? userDetailsInputStatus,
    String? phoneOTPVerificationId,
    LoginType? selectedLoginType,
  }) {
    return LoginState(
      isSignup: isSignup ?? this.isSignup,
      phoneNumberLoginState:
          phoneNumberLoginState ?? this.phoneNumberLoginState,
      emailPasswordLoginState:
          emailPasswordLoginState ?? this.emailPasswordLoginState,
      isLoading: isLoading ?? this.isLoading,
      userDetailsInputStatus:
          userDetailsInputStatus ?? this.userDetailsInputStatus,
      phoneOTPVerificationId:
          phoneOTPVerificationId ?? this.phoneOTPVerificationId,
      selectedLoginType: selectedLoginType ?? this.selectedLoginType,
    );
  }

  @visibleForTesting
  LoginState.test({
    PhoneNumberLoginState? phoneNumberLoginState,
    EmailPasswordLoginState? emailPasswordLoginState,
    bool? isSignup,
  })  : isSignup = isSignup ?? false,
        phoneNumberLoginState =
            phoneNumberLoginState ?? PhoneNumberLoginState.test(),
        emailPasswordLoginState =
            emailPasswordLoginState ?? EmailPasswordLoginState.test(),
        isLoading = false,
        userDetailsInputStatus = UserDetailsInputStatus.none,
        phoneOTPVerificationId = '',
        selectedLoginType = LoginType.PHONE;

  @override
  List<Object?> get props => [
        isSignup,
        phoneNumberLoginState,
        emailPasswordLoginState,
        isLoading,
        userDetailsInputStatus,
        phoneOTPVerificationId,
        selectedLoginType,
      ];
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

class NavigateToVerifiedScreenState extends LoginState {
  NavigateToVerifiedScreenState(super.state) : super.copy();
}

class NavigateToEmailVerifyScreenState extends LoginState {
  NavigateToEmailVerifyScreenState(super.state) : super.copy();
}

class SignupLoadingState extends LoginState {
  SignupLoadingState(LoginState state, {required bool isLoading})
      : super.copy(state.copyWith(isLoading: isLoading));
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

class ClearLoginWithEmailControllerState extends LoginState {
  ClearLoginWithEmailControllerState(super.state) : super.copy();
}
