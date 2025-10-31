import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/verify_email/bloc/verify_email_bloc.dart';
import 'package:skelter/presentation/verify_email/bloc/verify_email_event.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:skelter/widgets/app_button/enums/app_button_state_enum.dart';

class ResendVerificationMailButton extends StatelessWidget {
  const ResendVerificationMailButton({super.key});

  @override
  Widget build(BuildContext context) {
    final int resendEmailVerificationTimeLeft =
        context.select<VerifyEmailBloc, int>(
      (VerifyEmailBloc bloc) => bloc.state.resendTimeLeft,
    );

    final bool isLoading =
        context.select<VerifyEmailBloc, bool>((bloc) => bloc.state.isLoading);

    final String resendLinkText =
        '${context.localization.resend_verification_email} '
        '${resendEmailVerificationTimeLeft > 0 ? ''
            '($resendEmailVerificationTimeLeft)' : ''}';

    return AppButton(
      label: resendLinkText,
      shouldSetFullWidth: true,
      size: AppButtonSize.large,
      isLoading: isLoading,
      state: resendEmailVerificationTimeLeft != 0
          ? AppButtonState.disabled
          : AppButtonState.normal,
      onPressed: () {
        if (resendEmailVerificationTimeLeft == 0) {
          context.read<VerifyEmailBloc>().add(SendEmailVerificationLinkEvent());
        }
      },
    );
  }
}
