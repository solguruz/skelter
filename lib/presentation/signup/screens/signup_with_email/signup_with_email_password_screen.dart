import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/app_localizations.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/login/screens/login_with_phone_number/login_with_phone_number_screen.dart';
import 'package:skelter/presentation/login/widgets/login_app_bar.dart';
import 'package:skelter/presentation/signup/bloc/signup_bloc.dart';
import 'package:skelter/presentation/signup/bloc/signup_event.dart';
import 'package:skelter/presentation/signup/bloc/signup_state.dart';
import 'package:skelter/presentation/signup/screens/signup_with_email/widgets/email_next_button.dart';
import 'package:skelter/presentation/signup/screens/signup_with_email/widgets/email_text_field.dart';
import 'package:skelter/routes.gr.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

@RoutePage()
class SignupWithEmailPasswordScreen extends StatefulWidget {
  const SignupWithEmailPasswordScreen({super.key, this.signupBloc});

  final SignupBloc? signupBloc;

  @override
  State<SignupWithEmailPasswordScreen> createState() =>
      _SignupWithEmailPasswordScreenState();
}

class _SignupWithEmailPasswordScreenState
    extends State<SignupWithEmailPasswordScreen> {
  late final AppLocalizations appLocalizations = context.localization;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: widget.signupBloc != null
          ? (_) => widget.signupBloc!
          : (context) => SignupBloc(localizations: appLocalizations),
      child: Builder(
        builder: (context) {
          return PopScope(
            onPopInvokedWithResult: (didPop, result) {
              if (didPop) {
                context
                    .read<SignupBloc>()
                    .add(ResetSignUpStateOnScreenClosedEvent());
              }
            },
            child: Scaffold(
              appBar: const LoginAppBar(removeLeading: false),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: LoginWithPhoneNumberScreen.kHorizontalPadding,
                  ),
                  child: BlocListener<SignupBloc, SignupState>(
                    listener: _onListener,
                    child: const _SignupWithEmailPasswordScreenBody(),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _onListener(BuildContext context, SignupState state) async {
    if (state is NavigateToHomeScreenState) {
      context.router.popUntilRoot();
    } else if (state is NavigateToEmailVerifyScreenState) {
      await context.router.push(
        VerifyEmailRoute(
          email: state.email,
          isSignUp: true,
        ),
      );
    } else if (state is NavigateToCreatePasswordState) {
      unawaited(
        context.router.push(
          CreateYourPasswordRoute(signupBloc: context.read<SignupBloc>()),
        ),
      );
    }
  }
}

class _SignupWithEmailPasswordScreenBody extends StatelessWidget {
  const _SignupWithEmailPasswordScreenBody();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Center(
            child: Text(
              context.localization.sign_up_with_email,
              style: AppTextStyles.h2Bold.copyWith(
                color: context.currentTheme.textNeutralPrimary,
              ),
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
