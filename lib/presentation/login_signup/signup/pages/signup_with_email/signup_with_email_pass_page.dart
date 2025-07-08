import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_events.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_state.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/login_page.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/widgets/login_app_bar.dart';
import 'package:flutter_skeleton/presentation/login_signup/signup/pages/signup_with_email/widgets/email_next_button.dart';
import 'package:flutter_skeleton/presentation/login_signup/signup/pages/signup_with_email/widgets/email_text_field.dart';
import 'package:flutter_skeleton/routes.gr.dart';

@RoutePage()
class SignupWithEmailPasswordPage extends StatelessWidget {
  const SignupWithEmailPasswordPage({super.key, required this.loginBloc});

  final LoginBloc loginBloc;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          loginBloc.add(ResetSignUpStateOnPageClosedEvent());
        }
      },
      child: Scaffold(
        appBar: const LoginAppBar(),
        body: BlocProvider<LoginBloc>.value(
          value: loginBloc,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: LoginPage.kHorizontalPadding,
              ),
              child: BlocListener<LoginBloc, LoginState>(
                listener: _onListener,
                child: const _SignupWithEmailPasswordPageBody(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onListener(BuildContext context, LoginState state) async {
    if (state is NavigateToHomePageState) {
      context.router.popUntilRoot();
    } else if (state is NavigateToEmailVerifyPageState) {
      await context.router.push(
        VerifyEmailRoute(loginBloc: context.loginBloc),
      );
    } else if (state is NavigateToCreatePasswordState) {
      unawaited(
        context.router.push(
          CreateYourPasswordRoute(
            loginBloc: context.loginBloc,
          ),
        ),
      );
    }
  }
}

class _SignupWithEmailPasswordPageBody extends StatelessWidget {
  const _SignupWithEmailPasswordPageBody();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Center(
            child: Text(
              context.l10n.login_signup_sign_up_with_email,
              style: AppTextStyles.h2Bold,
            ),
          ),
          const SizedBox(height: 25),
          const EmailTextField(),
          const SizedBox(height: 30),
          const EmailNextButton(),
        ],
      ),
    );
  }
}
