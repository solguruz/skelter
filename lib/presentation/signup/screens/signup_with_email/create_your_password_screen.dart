import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/constants/constants.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login/login_screen.dart';
import 'package:flutter_skeleton/presentation/login/widgets/login_app_bar.dart';
import 'package:flutter_skeleton/presentation/signup/bloc/signup_bloc.dart';
import 'package:flutter_skeleton/presentation/signup/bloc/signup_event.dart';
import 'package:flutter_skeleton/presentation/signup/bloc/signup_state.dart';
import 'package:flutter_skeleton/presentation/signup/screens/signup_with_email/widgets/confirm_password_text_field.dart';
import 'package:flutter_skeleton/presentation/signup/screens/signup_with_email/widgets/password_next_button.dart';
import 'package:flutter_skeleton/presentation/signup/screens/signup_with_email/widgets/password_requirement_stats.dart';
import 'package:flutter_skeleton/presentation/signup/screens/signup_with_email/widgets/password_text_field.dart';
import 'package:flutter_skeleton/utils/extensions/build_context_extension.dart';
import 'package:flutter_skeleton/utils/extensions/primitive_extensions.dart';

@RoutePage()
class CreateYourPasswordScreen extends StatelessWidget {
  const CreateYourPasswordScreen({super.key, required this.signupBloc});

  final SignupBloc signupBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignupBloc>.value(
      value: signupBloc,
      child: PopScope(
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            signupBloc.add(ResetEmailStateEvent());
          }
        },
        child: Scaffold(
          appBar: const LoginAppBar(removeLeading: false),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: LoginScreen.kHorizontalPadding,
              ),
              child: BlocListener<SignupBloc, SignupState>(
                listener: (context, state) async {
                  if (state is AuthenticationExceptionState) {
                    _showAuthenticationError(state, context);
                  } else if (state is NavigateToHomeScreenState) {
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

  void _showAuthenticationError(
    AuthenticationExceptionState state,
    BuildContext context,
  ) {
    final String? error = state.authenticationErrorMessage;
    context.showSnackBar(
      error.isNullOrEmpty() ? kSomethingWentWrong : error!,
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
