import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/analytics/analytics_events.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_events.dart';
import 'package:flutter_skeleton/utils/analytics_helper.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';

class PasswordNextCTA extends StatelessWidget {
  const PasswordNextCTA({super.key});

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
      label: context.l10n.login_signup_next,
      fillWidth: true,
      size: AppButtonSize.l,
      state: confirmPassword.isNotEmpty && isPasswordValid
          ? AppButtonState.d_efault
          : AppButtonState.disabled,
      showLoader: isLoading,
      onPressed: () {
        AnalyticsHelper().logCustomEvent(
          DebugSignUpAnalyticsEvents.kTapSignupPasswordCTA,
        );
        SystemChannels.textInput.invokeMethod('TextInput.hide');

        if (!isPasswordValid) {
          return;
        }

        context.loginBloc.add(SignupWithEmailEvent());
      },
    );
  }
}
