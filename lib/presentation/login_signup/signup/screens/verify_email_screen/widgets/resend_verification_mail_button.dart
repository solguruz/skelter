import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_events.dart';
import 'package:flutter_skeleton/presentation/login_signup/signup/screens/verify_email_screen/verify_email_screen.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';

class ResendVerificationMailButton extends StatelessWidget {
  const ResendVerificationMailButton({super.key});

  @override
  Widget build(BuildContext context) {
    final int resendEmailVerificationTimeLeft = context.select<LoginBloc, int>(
      (LoginBloc bloc) =>
          bloc.state.signupState?.resendVerificationEmailTimeLeft ??
          VerifyEmailScreen.kResendVerificationEmailMaxSeconds,
    );

    final bool isLoading = context.select<LoginBloc, bool>(
      (bloc) => bloc.state.isLoading,
    );

    final String resendLinkText =
        '${context.l10n.login_signup_resend_verification_email} '
        '${resendEmailVerificationTimeLeft > 0 ? ''
            '($resendEmailVerificationTimeLeft)' : ''}';

    return AppButton(
      label: resendLinkText,
      fillWidth: true,
      size: AppButtonSize.l,
      showLoader: isLoading,
      state: resendEmailVerificationTimeLeft != 0
          ? AppButtonState.disabled
          : AppButtonState.d_efault,
      onPressed: () {
        if (resendEmailVerificationTimeLeft == 0) {
          context.loginBloc.add(SendEmailVerificationLinkEvent());
        }
      },
    );
  }
}
