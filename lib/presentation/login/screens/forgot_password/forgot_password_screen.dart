import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/login/bloc/login_bloc.dart';
import 'package:skelter/presentation/login/bloc/login_state.dart';
import 'package:skelter/presentation/login/screens/forgot_password/widgets/email_text_field.dart';
import 'package:skelter/presentation/login/screens/forgot_password/widgets/send_reset_link_button.dart';
import 'package:skelter/presentation/login/screens/login_with_phone_number/login_with_phone_number_screen.dart';
import 'package:skelter/presentation/login/widgets/login_app_bar.dart';
import 'package:skelter/routes.gr.dart';

@RoutePage()
class ForgotPasswordV2Screen extends StatelessWidget {
  const ForgotPasswordV2Screen({super.key, required this.loginBloc});

  final LoginBloc loginBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LoginAppBar(removeLeading: false),
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
        horizontal: LoginWithPhoneNumberScreen.kHorizontalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Center(
            child: Text(
              context.localization.forgot_password,
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
