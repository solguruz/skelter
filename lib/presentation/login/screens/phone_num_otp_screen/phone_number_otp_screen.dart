import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/login/bloc/login_bloc.dart';
import 'package:skelter/presentation/login/bloc/login_events.dart';
import 'package:skelter/presentation/login/bloc/login_state.dart';
import 'package:skelter/presentation/login/screens/phone_num_otp_screen/widgets/otp_input_field.dart';
import 'package:skelter/presentation/login/screens/phone_num_otp_screen/widgets/otp_verification_button.dart';
import 'package:skelter/presentation/login/widgets/login_app_bar.dart';
import 'package:skelter/routes.gr.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

@RoutePage()
class PhoneNumberOTPScreen extends StatefulWidget {
  const PhoneNumberOTPScreen({
    super.key,
    required this.loginBloc,
    this.isFromDeleteAccount = false,
  });

  final LoginBloc loginBloc;

  final bool isFromDeleteAccount;

  static const kResendOTPMaxSeconds = 60;

  @override
  PhoneNumberOTPScreenState createState() => PhoneNumberOTPScreenState();
}

class PhoneNumberOTPScreenState extends State<PhoneNumberOTPScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          widget.loginBloc.add(PhoneOtpTextChangeEvent(phoneOtpText: ''));
          widget.loginBloc
              .add(IsResendOTPEnabledEvent(isResendOTPEnabled: false));
          widget.loginBloc.add(PhoneNumLoginLoadingEvent(isLoading: false));
        }
      },
      child: Scaffold(
        appBar: const LoginAppBar(removeLeading: false),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocProvider<LoginBloc>.value(
            value: widget.loginBloc,
            child: _PhoneNumberOTPScreenBody(
              isFromDeleteAccount: widget.isFromDeleteAccount,
            ),
          ),
        ),
      ),
    );
  }
}

class _PhoneNumberOTPScreenBody extends StatelessWidget {
  const _PhoneNumberOTPScreenBody({
    required this.isFromDeleteAccount,
  });

  final bool isFromDeleteAccount;

  @override
  Widget build(BuildContext context) {
    final String phoneNumber =
        context.read<LoginBloc>().state.phoneNumberLoginState?.phoneNumber ??
            '';
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) async {
        if (state is NavigateToHomeScreenState) {
// If user came from Delete Account flow, return them to DeleteAccountScreen
          if (isFromDeleteAccount) {
            await context.router.replace(const DeleteAccountRoute());
          } else {
            // Default flow: go to home
            context.router.popUntilRoot();
          }
        } else if (state is NavigateToVerifiedScreenState) {
          await context.router.replaceAll(
            [PhoneNumberVerifiedRoute(loginBloc: context.read<LoginBloc>())],
          );
        }
      },
      child: Column(
        children: [
          Text(
            context.localization.enter_otp,
            textAlign: TextAlign.center,
            style: AppTextStyles.h2Bold.copyWith(
              color: context.currentTheme.textNeutralPrimary,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${context.localization.sent_code_info} '
            '$phoneNumber',
            textAlign: TextAlign.center,
            style: AppTextStyles.p2Medium.copyWith(
              color: context.currentTheme.textNeutralSecondary,
            ),
          ),
          const SizedBox(height: 20),
          const OTPCodeInputField(),
          const SizedBox(height: 32),
          const OTPVerificationButton(),
        ],
      ),
    );
  }
}
