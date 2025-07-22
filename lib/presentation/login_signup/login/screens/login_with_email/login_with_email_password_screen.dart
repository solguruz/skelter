import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/constants/constants.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_events.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_state.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/login_screen.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/screens/login_with_email/widgets/email_password_text_fields.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/screens/login_with_email/widgets/forgot_password_button.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/screens/login_with_email/widgets/login_with_email_pass_button.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/widgets/login_app_bar.dart';
import 'package:flutter_skeleton/utils/extensions/build_context_ext.dart';
import 'package:flutter_skeleton/utils/extensions/string.dart';

@RoutePage()
class LoginWithEmailPasswordScreen extends StatelessWidget {
  const LoginWithEmailPasswordScreen({super.key, required this.loginBloc});

  final LoginBloc loginBloc;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          loginBloc.add(ResetEmailStateEvent());
          loginBloc.add(ResetSignUpStateOnScreenClosedEvent());
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
                  if (state is AuthenticationExceptionState) {
                    _showAuthenticationError(state, context);
                  } else if (state is NavigateToHomeScreenState) {
                    context.router.popUntilRoot();
                  }
                },
                child: const _LoginWithEmailScreenBody(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showAuthenticationError(
    AuthenticationExceptionState state,
    BuildContext context,
  ) {
    final String? error =
        state.emailPasswordLoginState?.authenticationErrorMessage;
    context.showSnackBar(
      error.isNullOrEmpty() ? kSomethingWentWrong : error!,
    );
  }
}

class _LoginWithEmailScreenBody extends StatelessWidget {
  const _LoginWithEmailScreenBody();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Center(
            child: Text(
              context.localization.login_signup_login_with_email,
              style: AppTextStyles.h2Bold,
            ),
          ),
          const SizedBox(height: 25),
          const EmailPasswordTextFields(),
          const SizedBox(height: 8),
          const Align(
            alignment: Alignment.centerRight,
            child: ForgotPasswordButton(),
          ),
          const SizedBox(height: 20),
          const LoginWithEmailPassButton(),
        ],
      ),
    );
  }
}
