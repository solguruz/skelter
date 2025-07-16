import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_state.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/login_screen.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/screens/forgot_password/widgets/email_text_field.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/screens/forgot_password/widgets/send_reset_link_button.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/widgets/login_app_bar.dart';
import 'package:flutter_skeleton/routes.gr.dart';

@RoutePage()
class ForgotPasswordV2Screen extends StatelessWidget {
  const ForgotPasswordV2Screen({super.key, required this.loginBloc});

  final LoginBloc loginBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LoginAppBar(),
      body: SafeArea(
        child: BlocProvider<LoginBloc>.value(
          value: loginBloc,
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is ResetPasswordLinkSentState) {
                context.router.replace(
                  CheckYourEmailRoute(loginBloc: loginBloc),
                );
              }
            },
            child: const ForgotPasswordV2ScreenBody(),
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordV2ScreenBody extends StatelessWidget {
  const ForgotPasswordV2ScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: LoginScreen.kHorizontalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Center(
            child: Text(
              context.localization.login_signup_forgot_password,
              style: AppTextStyles.h2Bold,
            ),
          ),
          const SizedBox(height: 16),
          const EmailTextField(),
          const SizedBox(height: 24),
          const SendResetLinkButton(),
        ],
      ),
    );
  }
}
