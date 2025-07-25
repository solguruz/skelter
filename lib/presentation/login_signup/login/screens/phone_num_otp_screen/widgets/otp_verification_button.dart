import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_events.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/screens/phone_num_otp_screen/phone_number_otp_screen.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_state_enum.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_style_enum.dart';

class OTPVerificationButton extends StatelessWidget {
  const OTPVerificationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final String mobileOtpText = context.select<LoginBloc, String>(
      (LoginBloc bloc) => bloc.state.phoneNumberLoginState?.phoneOTPText ?? '',
    );
    final bool isLoading = context.select<LoginBloc, bool>(
      (LoginBloc bloc) => bloc.state.isLoading,
    );

    return Column(
      children: [
        AppButton(
          label: context.localization.login_signup_verify,
          shouldSetFullWidth: true,
          size: AppButtonSize.large,
          state: mobileOtpText.isNotEmpty && mobileOtpText.length == 6
              ? AppButtonState.normal
              : AppButtonState.disabled,
          isLoading: isLoading,
          onPressed: () {
            if (mobileOtpText.isNotEmpty && mobileOtpText.length == 6) {
              context.read<LoginBloc>().add(FirebaseOTPVerificationEvent());
            }
          },
        ),
        const SizedBox(height: 16),
        const _ResendOTPButton(),
      ],
    );
  }
}

class _ResendOTPButton extends StatefulWidget {
  const _ResendOTPButton();

  @override
  State<_ResendOTPButton> createState() => _ResendOTPButtonState();
}

class _ResendOTPButtonState extends State<_ResendOTPButton> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int resendTimeLeft = context.select<LoginBloc, int>(
      (LoginBloc bloc) =>
          bloc.state.phoneNumberLoginState?.resendOTPTimeLeft ??
          PhoneNumberOTPScreen.kResendOTPMaxSeconds,
    );

    final bool isResendOTPEnabled = context.select<LoginBloc, bool>(
      (LoginBloc bloc) =>
          bloc.state.phoneNumberLoginState?.isResendOTPEnabled ?? false,
    );

    final String resendOTPText = '${context.localization.login_signup_resend} '
        '${resendTimeLeft > 0 ? '($resendTimeLeft)' : ''}';

    return AppButton(
      label: resendOTPText,
      shouldSetFullWidth: true,
      size: AppButtonSize.large,
      style: AppButtonStyle.textOrIcon,
      state:
          isResendOTPEnabled ? AppButtonState.normal : AppButtonState.disabled,
      onPressed: () {
        if (isResendOTPEnabled) {
          context
              .read<LoginBloc>()
              .add(FirebasePhoneLoginEvent(isFromVerificationScreen: true));
          context
              .read<LoginBloc>()
              .add(IsResendOTPEnabledEvent(isResendOTPEnabled: false));
          startTimer();
        }
      },
    );
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final timeLeft = PhoneNumberOTPScreen.kResendOTPMaxSeconds - timer.tick;
      if (timeLeft >= 0) {
        context
            .read<LoginBloc>()
            .add(ResendOTPTimeLeftEvent(resentOTPTimeLeft: timeLeft));
      } else {
        timer.cancel();
        context
            .read<LoginBloc>()
            .add(IsResendOTPEnabledEvent(isResendOTPEnabled: true));
      }
    });
  }
}
