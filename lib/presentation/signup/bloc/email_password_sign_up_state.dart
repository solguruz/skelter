import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class EmailPasswordSignUpState with EquatableMixin {
  final String email;
  final String password;
  final String? emailErrorMessage;
  final bool isPasswordVisible;
  final String? passwordErrorMessage;
  final String? authenticationErrorMessage;

  const EmailPasswordSignUpState({
    required this.email,
    required this.password,
    required this.emailErrorMessage,
    required this.passwordErrorMessage,
    required this.isPasswordVisible,
    required this.authenticationErrorMessage,
  });

  factory EmailPasswordSignUpState.initial() {
    return const EmailPasswordSignUpState(
      email: '',
      password: '',
      emailErrorMessage: null,
      passwordErrorMessage: null,
      isPasswordVisible: false,
      authenticationErrorMessage: null,
    );
  }

  EmailPasswordSignUpState copyWith({
    String? email,
    String? password,
    String? emailErrorMessage,
    bool? isPasswordVisible,
    String? passwordErrorMessage,
    String? authenticationErrorMessage,
    bool canSetEmailErrorMessageToNull = false,
    bool canSetPasswordErrorMessageToNull = false,
  }) {
    return EmailPasswordSignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      emailErrorMessage: emailErrorMessage ??
          (canSetEmailErrorMessageToNull ? null : this.emailErrorMessage),
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      passwordErrorMessage: passwordErrorMessage ??
          (canSetPasswordErrorMessageToNull ? null : this.passwordErrorMessage),
      authenticationErrorMessage:
          authenticationErrorMessage ?? this.authenticationErrorMessage,
    );
  }

  @visibleForTesting
  factory EmailPasswordSignUpState.test({
    String? email,
    String? password,
    String? emailErrorMessage,
    String? passwordErrorMessage,
    bool? isPasswordVisible,
    String? authenticationErrorMessage,
  }) {
    return EmailPasswordSignUpState(
      email: email ?? '',
      password: password ?? '',
      emailErrorMessage: emailErrorMessage,
      passwordErrorMessage: passwordErrorMessage,
      isPasswordVisible: isPasswordVisible ?? false,
      authenticationErrorMessage: authenticationErrorMessage,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        emailErrorMessage,
        isPasswordVisible,
        passwordErrorMessage,
        authenticationErrorMessage,
      ];
}
