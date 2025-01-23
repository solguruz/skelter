import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_events.dart';
import 'package:flutter_skeleton/validators/validators.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';

class LoginWithEmailPassCTA extends StatelessWidget {
  const LoginWithEmailPassCTA({
    super.key,
  });

  static const kMinimumPasswordLengthLogin = 3;

  @override
  Widget build(BuildContext context) {
    final bool isLoading = context.select<LoginBloc, bool>(
      (bloc) => bloc.state.isLoading,
    );
    final String email = context.select<LoginBloc, String>(
      (bloc) => bloc.state.emailPasswordLoginState?.email ?? '',
    );

    final String password = context.select<LoginBloc, String>(
      (bloc) => bloc.state.emailPasswordLoginState?.password ?? '',
    );

    return AppButton(
      label: context.l10n.login_signup_login,
      fillWidth: true,
      size: AppButtonSize.l,
      state: email.isNotEmpty && _isPasswordLongEnough(password)
          ? AppButtonState.d_efault
          : AppButtonState.disabled,
      showLoader: isLoading,
      onPressed: () {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
        bool shouldReturn = false;
        final String? emailError = isEmailValid(email, context);
        if (emailError != null) {
          context.loginBloc.add(EmailErrorEvent(errorMessage: emailError));
          shouldReturn = true;
        }

        final String? password =
            context.loginBloc.state.emailPasswordLoginState?.password;
        if (password == null || password.isEmpty) {
          context.loginBloc.add(
            PasswordErrorEvent(
              errorMessage: context.l10n.login_signup_password_cant_be_empty,
            ),
          );
          shouldReturn = true;
        }
        if (shouldReturn) return;
        context.loginBloc.add(EmailPasswordLoginEvent());
      },
    );
  }

  bool _isPasswordLongEnough(String? password) {
    if (password == null) return false;

    return password.length >= kMinimumPasswordLengthLogin;
  }
}
