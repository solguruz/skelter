import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_events.dart';
import 'package:flutter_skeleton/routes.gr.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_state_enum.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_style_enum.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      label: context.localization.login_signup_ask_forgot_password,
      style: AppButtonStyle.textOrIcon,
      size: AppButtonSize.large,
      state: AppButtonState.disabled,
      foregroundColor: AppColors.textNeutralDisable,
      onPressed: () {
        final String? emailError = context
            .read<LoginBloc>()
            .state
            .emailPasswordLoginState
            ?.emailErrorMessage;
        final String? passwordError = context
            .read<LoginBloc>()
            .state
            .emailPasswordLoginState
            ?.passwordErrorMessage;

        if (emailError != null && emailError.isNotEmpty) {
          context.read<LoginBloc>().add(EmailErrorEvent(errorMessage: ''));
        }

        if (passwordError != null && passwordError.isNotEmpty) {
          context.read<LoginBloc>().add(PasswordErrorEvent(errorMessage: ''));
        }

        context.pushRoute(
          ForgotPasswordV2Route(loginBloc: context.read<LoginBloc>()),
        );
      },
    );
  }
}
