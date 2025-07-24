import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_events.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_state.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/screens/phone_num_otp_screen/widgets/otp_input_field.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/screens/phone_num_otp_screen/widgets/otp_verification_button.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/widgets/login_app_bar.dart';
import 'package:flutter_skeleton/routes.gr.dart';

@RoutePage()
class PhoneNumberOTPScreen extends StatefulWidget {
  const PhoneNumberOTPScreen({
    super.key,
    required this.loginBloc,
  });

  final LoginBloc loginBloc;

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
        appBar: const LoginAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocProvider<LoginBloc>.value(
            value: widget.loginBloc,
            child: const _PhoneNumberOTPScreenBody(),
          ),
        ),
      ),
    );
  }
}

class _PhoneNumberOTPScreenBody extends StatelessWidget {
  const _PhoneNumberOTPScreenBody();

  @override
  Widget build(BuildContext context) {
    final String phoneNumber =
        context.read<LoginBloc>().state.phoneNumberLoginState?.phoneNumber ??
            '';
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) async {
        if (state is NavigateToHomeScreenState) {
          context.router.popUntilRoot();
        } else if (state is NavigateToVerifiedScreenState) {
          await context.router.replace(
            PhoneNumberVerifiedRoute(loginBloc: context.read<LoginBloc>()),
          );
        } else if (state is NavigateToChooseHandleState) {
          // TODO: add navigation
          // await context.router.replace(
          //   ChooseHandleRoute(loginBloc: context.loginV2Bloc),
          // );
        }
      },
      child: Column(
        children: [
          Text(
            context.localization.login_signup_enter_otp,
            textAlign: TextAlign.center,
            style: AppTextStyles.h2Bold,
          ),
          const SizedBox(height: 10),
          Text(
            '${context.localization.login_signup_sent_code_info} '
            '$phoneNumber',
            textAlign: TextAlign.center,
            style: AppTextStyles.p2Medium,
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
