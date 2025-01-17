import 'package:flutter_skeleton/analytics/analytics_events.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/analytics_helper.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_events.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendOTPCTA extends StatelessWidget {
  const SendOTPCTA({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final bool isSignup = context.select<LoginBloc, bool>(
      (bloc) => bloc.state.isSignup,
    );
    final bool isLoading = context.select<LoginBloc, bool>(
      (bloc) => bloc.state.isLoading,
    );
    final String countryCode = context.select<LoginBloc, String>(
      (bloc) => bloc.state.phoneNumberLoginState?.countryCode ?? '',
    );
    final String phoneNumWithCountryCode = context.select<LoginBloc, String>(
      (bloc) => bloc.state.phoneNumberLoginState?.phoneNumber ?? '',
    );
    String phoneNumberOnly = '';
    if (countryCode.isNotEmpty) {
      phoneNumberOnly = phoneNumWithCountryCode.substring(
        countryCode.length,
        phoneNumWithCountryCode.length,
      );
    }

    return AppButton(
      label: isSignup
          ? context.l10n.login_signup_next
          : context.l10n.login_signup_send_otp,
      fillWidth: true,
      size: AppButtonSize.l,
      state: phoneNumberOnly.isNotEmpty
          ? AppButtonState.d_efault
          : AppButtonState.disabled,
      showLoader: isLoading,
      onPressed: () {
        if (phoneNumberOnly.isNotEmpty) {
          FocusScope.of(context).unfocus();
          AnalyticsHelper().logCustomEvent(
            DebugPhoneLoginAnalyticsEvents.kFunctionCall,
          );
          context.loginBloc
              .add(LoginWithPhoneNumEvent(phoneNumWithCountryCode));
        }
      },
    );
  }
}
