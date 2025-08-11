import 'package:equatable/equatable.dart';
import 'package:flutter_skeleton/presentation/signup/enum/user_details_input_status.dart';
import 'package:flutter_skeleton/presentation/verify_email/screens/verify_email_screen.dart';

class VerifyEmailState with EquatableMixin {
  final UserDetailsInputStatus userDetailsInputStatus;
  final int resendTimeLeft;
  final bool isLoading;
  final String? email;
  final bool isSignUp;

  VerifyEmailState({
    this.userDetailsInputStatus = UserDetailsInputStatus.none,
    this.resendTimeLeft = VerifyEmailScreen.kResendVerificationEmailMaxSeconds,
    this.isLoading = false,
    this.email,
    this.isSignUp = false,
  });

  VerifyEmailState.copy(VerifyEmailState state)
      : this(
          isLoading: state.isLoading,
          userDetailsInputStatus: state.userDetailsInputStatus,
          email: state.email,
          isSignUp: state.isSignUp,
        );

  VerifyEmailState copyWith({
    UserDetailsInputStatus? userDetailsInputStatus,
    int? resendTimeLeft,
    bool? isLoading,
    String? email,
    bool? isSignUp,
  }) {
    return VerifyEmailState(
      userDetailsInputStatus:
          userDetailsInputStatus ?? this.userDetailsInputStatus,
      isLoading: isLoading ?? this.isLoading,
      resendTimeLeft: resendTimeLeft ?? this.resendTimeLeft,
      email: email ?? this.email,
      isSignUp: isSignUp ?? this.isSignUp,
    );
  }

  @override
  List<Object?> get props =>
      [userDetailsInputStatus, resendTimeLeft, isLoading, isSignUp, email];
}

class VerifyEmailInitialState extends VerifyEmailState {}

class RestartVerificationMailResendTimerState extends VerifyEmailState {
  RestartVerificationMailResendTimerState(super.state) : super.copy();
}

class VerificationCodeFailedToSendState extends VerifyEmailState {
  VerificationCodeFailedToSendState(super.state) : super.copy();
}

class ResendVerificationEmailTimeLeftState extends VerifyEmailState {
  ResendVerificationEmailTimeLeftState(super.state) : super.copy();
}

class NavigateToHomeState extends VerifyEmailState {
  NavigateToHomeState(super.state) : super.copy();
}
