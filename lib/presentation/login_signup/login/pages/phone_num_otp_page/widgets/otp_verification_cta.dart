import 'dart:async';

import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_events.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/pages/phone_num_otp_page/phone_num_otp_page.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OTPVerificationCTA extends StatelessWidget {
  const OTPVerificationCTA({
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
          label: context.l10n.login_signup_verify,
          fillWidth: true,
          size: AppButtonSize.l,
          state: mobileOtpText.isNotEmpty && mobileOtpText.length == 6
              ? AppButtonState.d_efault
              : AppButtonState.disabled,
          showLoader: isLoading,
          onPressed: () {
            if (mobileOtpText.isNotEmpty && mobileOtpText.length == 6) {
              context.loginBloc.add(FirebaseOTPVerificationEvent());
            }
          },
        ),
        const SizedBox(height: 16),
        const _ResendOTPCTA(),
      ],
    );
  }
}

class _ResendOTPCTA extends StatefulWidget {
  const _ResendOTPCTA();

  @override
  State<_ResendOTPCTA> createState() => _ResendOTPCTAState();
}

class _ResendOTPCTAState extends State<_ResendOTPCTA> {
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
          PhoneNumberOTPPage.kResendOTPMaxSeconds,
    );

    final bool isResendOTPEnabled = context.select<LoginBloc, bool>(
      (LoginBloc bloc) =>
          bloc.state.phoneNumberLoginState?.isResendOTPEnabled ?? false,
    );

    final String resendOTPText = '${context.l10n.login_signup_resend} '
        '${resendTimeLeft > 0 ? '($resendTimeLeft)' : ''}';

    return AppButton(
      label: resendOTPText,
      fillWidth: true,
      size: AppButtonSize.l,
      style: AppButtonStyle.textOrIcon,
      state: isResendOTPEnabled
          ? AppButtonState.d_efault
          : AppButtonState.disabled,
      onPressed: () {
        if (isResendOTPEnabled) {
          context.loginBloc
              .add(FirebasePhoneLoginEvent(isFromVerificationPage: true));
          context.loginBloc
              .add(IsResendOTPEnabledEvent(isResendOTPEnabled: false));
          startTimer();
        }
      },
    );
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final timeLeft = PhoneNumberOTPPage.kResendOTPMaxSeconds - timer.tick;
      if (timeLeft >= 0) {
        context.loginBloc
            .add(ResendOTPTimeLeftEvent(resentOTPTimeLeft: timeLeft));
      } else {
        timer.cancel();
        context.loginBloc
            .add(IsResendOTPEnabledEvent(isResendOTPEnabled: true));
      }
    });
  }
}
