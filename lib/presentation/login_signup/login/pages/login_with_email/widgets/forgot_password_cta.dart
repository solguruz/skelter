import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_events.dart';
import 'package:flutter_skeleton/routes.gr.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class ForgotPasswordCTA extends StatelessWidget {
  const ForgotPasswordCTA({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      label: context.l10n.login_signup_ask_forgot_password,
      style: AppButtonStyle.textOrIcon,
      size: AppButtonSize.l,
      state: AppButtonState.disabled,
      iconOrTextColorOverride: AppColors.textNeutralDisable,
      onPressed: () {
        final String? emailError =
            context.loginBloc.state.emailPasswordLoginState?.emailErrorMessage;
        final String? passwordError = context
            .loginBloc.state.emailPasswordLoginState?.passwordErrorMessage;

        if (emailError != null && emailError.isNotEmpty) {
          context.loginBloc.add(EmailErrorEvent(errorMessage: ''));
        }

        if (passwordError != null && passwordError.isNotEmpty) {
          context.loginBloc.add(PasswordErrorEvent(errorMessage: ''));
        }

        context.pushRoute(ForgotPasswordV2Route(loginBloc: context.loginBloc));
      },
    );
  }
}
