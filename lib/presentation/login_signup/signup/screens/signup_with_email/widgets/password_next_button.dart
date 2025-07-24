import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_events.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_state_enum.dart';

class PasswordNextButton extends StatelessWidget {
  const PasswordNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLoading = context.select<LoginBloc, bool>(
      (bloc) => bloc.state.isLoading,
    );

    final String confirmPassword = context.select<LoginBloc, String>(
      (bloc) => bloc.state.signupState?.password ?? '',
    );

    final bool isPasswordValid = context.select<LoginBloc, bool>(
      (bloc) => (bloc.state.signupState?.passwordStrengthLevel ?? 0) >= 3,
    );

    return AppButton(
      label: context.localization.login_signup_next,
      shouldSetFullWidth: true,
      size: AppButtonSize.large,
      state: confirmPassword.isNotEmpty && isPasswordValid
          ? AppButtonState.normal
          : AppButtonState.disabled,
      isLoading: isLoading,
      onPressed: () {
        SystemChannels.textInput.invokeMethod('TextInput.hide');

        if (!isPasswordValid) {
          return;
        }

        context.read<LoginBloc>().add(SignupWithEmailEvent());
      },
    );
  }
}
