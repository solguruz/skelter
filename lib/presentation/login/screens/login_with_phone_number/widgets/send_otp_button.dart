import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/constants/integration_test_keys.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/login/bloc/login_bloc.dart';
import 'package:skelter/presentation/login/bloc/login_events.dart';
import 'package:skelter/utils/extensions/build_context_ext.dart';
import 'package:skelter/utils/internet_connectivity_helper.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:skelter/widgets/app_button/enums/app_button_state_enum.dart';

class SendOTPButton extends StatelessWidget {
  const SendOTPButton({super.key});

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
      key: keys.signInPage.sendOTPButton,
      label: isSignup
          ? context.localization.next
          : context.localization.send_otp,
      shouldSetFullWidth: true,
      size: AppButtonSize.large,
      state: phoneNumberOnly.isNotEmpty
          ? AppButtonState.normal
          : AppButtonState.disabled,
      isLoading: isLoading,
      onPressed: () async {
        final isConnected =
            InternetConnectivityHelper().onConnectivityChange.value;

        if (!isConnected && context.mounted) {
          context.showSnackBar(context.localization.no_internet_connection);
          return;
        }

        if (phoneNumberOnly.isNotEmpty) {
          FocusScope.of(context).unfocus();

          context
              .read<LoginBloc>()
              .add(LoginWithPhoneNumEvent(phoneNumWithCountryCode));
        }
      },
    );
  }
}
