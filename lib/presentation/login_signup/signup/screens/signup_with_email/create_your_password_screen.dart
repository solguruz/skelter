import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_events.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_state.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/login_screen.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/widgets/login_app_bar.dart';
import 'package:flutter_skeleton/presentation/login_signup/signup/screens/signup_with_email/widgets/confirm_password_text_field.dart';
import 'package:flutter_skeleton/presentation/login_signup/signup/screens/signup_with_email/widgets/password_next_button.dart';
import 'package:flutter_skeleton/presentation/login_signup/signup/screens/signup_with_email/widgets/password_requirement_stats.dart';
import 'package:flutter_skeleton/presentation/login_signup/signup/screens/signup_with_email/widgets/password_text_field.dart';

@RoutePage()
class CreateYourPasswordScreen extends StatelessWidget {
  const CreateYourPasswordScreen({super.key, required this.loginBloc});

  final LoginBloc loginBloc;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          loginBloc.add(ResetEmailStateEvent());
        }
      },
      child: Scaffold(
        appBar: const LoginAppBar(),
        body: BlocProvider<LoginBloc>.value(
          value: loginBloc,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: LoginScreen.kHorizontalPadding,
              ),
              child: BlocListener<LoginBloc, LoginState>(
                listener: (context, state) async {
                  if (state is NavigateToHomeScreenState) {
                    context.router.popUntilRoot();
                  }
                },
                child: const _CreateYourPasswordScreenBody(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CreateYourPasswordScreenBody extends StatelessWidget {
  const _CreateYourPasswordScreenBody();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 16),
          Text(
            context.localization.login_signup_create_your_password,
            style: AppTextStyles.h2Bold,
          ),
          const SizedBox(height: 25),
          const PasswordTextField(),
          const SizedBox(height: 25),
          const PasswordRequirementStats(),
          const SizedBox(height: 25),
          const ConfirmPasswordTextField(),
          const SizedBox(height: 30),
          const PasswordNextButton(),
        ],
      ),
    );
  }
}
