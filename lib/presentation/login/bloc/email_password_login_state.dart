part of 'login_state.dart';

class EmailPasswordLoginState with EquatableMixin {
  final String email;
  final String password;
  final String? emailErrorMessage;
  final bool isPasswordVisible;
  final String? passwordErrorMessage;
  final String? authenticationErrorMessage;

  EmailPasswordLoginState({
    required this.email,
    required this.password,
    required this.emailErrorMessage,
    required this.passwordErrorMessage,
    required this.isPasswordVisible,
    required this.authenticationErrorMessage,
  });

  factory EmailPasswordLoginState.initial() {
    return EmailPasswordLoginState(
      email: '',
      password: '',
      emailErrorMessage: null,
      passwordErrorMessage: null,
      isPasswordVisible: false,
      authenticationErrorMessage: null,
    );
  }

  EmailPasswordLoginState.copy(EmailPasswordLoginState state)
      : this(
          email: state.email,
          password: state.password,
          emailErrorMessage: state.emailErrorMessage,
          passwordErrorMessage: state.passwordErrorMessage,
          isPasswordVisible: state.isPasswordVisible,
          authenticationErrorMessage: state.authenticationErrorMessage,
        );

  EmailPasswordLoginState copyWith({
    String? email,
    String? password,
    String? emailErrorMessage,
    bool? isPasswordVisible,
    String? passwordErrorMessage,
    String? authenticationErrorMessage,
    bool canSetEmailErrorMessageToNull = false,
    bool canSetPasswordErrorMessageToNull = false,
  }) {
    return EmailPasswordLoginState(
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
  factory EmailPasswordLoginState.test({
    String? email,
    String? password,
    String? emailErrorMessage,
    String? passwordErrorMessage,
    bool? isPasswordVisible,
    String? authenticationErrorMessage,
  }) {
    return EmailPasswordLoginState(
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
