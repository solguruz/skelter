import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_events.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_state.dart';
import 'package:flutter_skeleton/utils/extensions/string.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:pinput/pinput.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OTPCodeInputField extends StatefulWidget {
  const OTPCodeInputField({
    super.key,
  });

  @override
  State<OTPCodeInputField> createState() => _OTPCodeInputFieldState();
}

class _OTPCodeInputFieldState extends State<OTPCodeInputField>
    with CodeAutoFill {
  late TextEditingController _pinController;
  static const double pinHeight = 56;
  static const double pinWidth = 48;

  @override
  void initState() {
    _pinController = TextEditingController();
    super.initState();
    // TODO: prevent in test environment
    SmsAutoFill().listenForCode();
  }

  @override
  void codeUpdated() {
    FirebaseOTPAutoVerificationEvent(otpCode: code ?? '');
  }

  @override
  void dispose() {
    _pinController.dispose();
    // TODO: prevent in test environment
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String? errorText = context.select<LoginBloc, String?>(
      (LoginBloc bloc) =>
          bloc.state.phoneNumberLoginState?.phoneOTPErrorMessage,
    );
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is FirebaseOTPAutoVerificationState) {
          _pinController.text = state.phoneNumberLoginState?.phoneOTPText ?? '';
        }
      },
      child: PopScope(
        onPopInvokedWithResult: (didPop, result) {
          if (errorText.haveContent()) {
            context.read<LoginBloc>().add(PhoneOtpErrorEvent(errorMessage: ''));
          }
          if (_pinController.text.isNotEmpty) {
            _pinController.text = '';
            context
                .read<LoginBloc>()
                .add(PhoneOtpTextChangeEvent(phoneOtpText: ''));
          }
          final bool isResendOTPEnabled = context
                  .read<LoginBloc>()
                  .state
                  .phoneNumberLoginState
                  ?.isResendOTPEnabled ??
              false;
          if (isResendOTPEnabled) {
            context
                .read<LoginBloc>()
                .add(IsResendOTPEnabledEvent(isResendOTPEnabled: false));
          }
        },
        child: Pinput(
          length: 6,
          controller: _pinController,
          focusedPinTheme: _focusedPinTheme(),
          defaultPinTheme: _defaultPinTheme(),
          submittedPinTheme: _submittedPinTheme(),
          errorPinTheme: errorText.isNullOrEmpty() ? null : _errorPinTheme(),
          pinAnimationType: PinAnimationType.fade,
          forceErrorState: true,
          errorText: errorText.isNullOrEmpty() ? null : errorText,
          errorTextStyle: AppTextStyles.p4Regular.withColor(
            AppColors.textErrorSecondary,
          ),
          onChanged: (pin) {
            if (errorText.haveContent()) {
              context
                  .read<LoginBloc>()
                  .add(PhoneOtpErrorEvent(errorMessage: ''));
            }
            context
                .read<LoginBloc>()
                .add(PhoneOtpTextChangeEvent(phoneOtpText: pin));
          },
          onCompleted: (phoneOtpText) {
            if (phoneOtpText.isNotEmpty && phoneOtpText.length == 6) {
              context.read<LoginBloc>().add(FirebaseOTPVerificationEvent());
            }
          },
        ),
      ),
    );
  }

  PinTheme _defaultPinTheme() {
    return PinTheme(
      width: pinWidth,
      height: pinHeight,
      decoration: _pinInputBoxDecoration(),
      textStyle: AppTextStyles.h2Bold,
    );
  }

  PinTheme _focusedPinTheme() {
    return PinTheme(
      width: pinWidth,
      height: pinHeight,
      decoration: _pinInputBoxDecoration().copyWith(
        border: Border.all(color: AppColors.strokeBrandDefault),
      ),
      textStyle: AppTextStyles.h2Bold,
    );
  }

  PinTheme _submittedPinTheme() {
    return PinTheme(
      width: pinWidth,
      height: pinHeight,
      decoration: _pinInputBoxDecoration().copyWith(
        border: Border.all(color: AppColors.strokeNeutralDefault),
      ),
      textStyle: AppTextStyles.h2Bold,
    );
  }

  PinTheme _errorPinTheme() {
    return PinTheme(
      width: pinWidth,
      height: pinHeight,
      decoration: _pinInputBoxDecoration().copyWith(
        border: Border.all(color: AppColors.strokeErrorDefault),
      ),
      textStyle: AppTextStyles.h2Bold,
    );
  }

  BoxDecoration _pinInputBoxDecoration() {
    return BoxDecoration(
      border: Border.all(color: AppColors.strokeNeutralLight200),
      color: AppColors.bgShadesWhite,
      borderRadius: BorderRadius.circular(8),
    );
  }
}
