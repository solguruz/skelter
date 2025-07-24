import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_events.dart';
import 'package:flutter_skeleton/utils/extensions/build_context_ext.dart';
import 'package:flutter_skeleton/utils/internet_connectivity_helper.dart';
import 'package:flutter_skeleton/validators/validators.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_state_enum.dart';

class LoginWithEmailPassButton extends StatelessWidget {
  const LoginWithEmailPassButton({
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
      label: context.localization.login_signup_login,
      shouldSetFullWidth: true,
      size: AppButtonSize.large,
      state: email.isNotEmpty && _isPasswordLongEnough(password)
          ? AppButtonState.normal
          : AppButtonState.disabled,
      isLoading: isLoading,
      onPressed: () async {
        await SystemChannels.textInput.invokeMethod('TextInput.hide');
        final isConnected =
            InternetConnectivityHelper().onConnectivityChange.value;

        if (!isConnected && context.mounted) {
          context.showSnackBar(context.localization.no_internet_connection);
          return;
        }

        bool shouldReturn = false;
        final String? emailError = isEmailValid(email, context);
        if (emailError != null) {
          context
              .read<LoginBloc>()
              .add(EmailErrorEvent(errorMessage: emailError));
          shouldReturn = true;
        }

        final String? password =
            context.read<LoginBloc>().state.emailPasswordLoginState?.password;
        if (password == null || password.isEmpty) {
          context.read<LoginBloc>().add(
                PasswordErrorEvent(
                  errorMessage:
                      context.localization.login_signup_password_cant_be_empty,
                ),
              );
          shouldReturn = true;
        }
        if (shouldReturn) return;
        context.read<LoginBloc>().add(EmailPasswordLoginEvent());
      },
    );
  }

  bool _isPasswordLongEnough(String? password) {
    if (password == null) return false;

    return password.length >= kMinimumPasswordLengthLogin;
  }
}
