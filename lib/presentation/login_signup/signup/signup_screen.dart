import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/constants/constants.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_events.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_state.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/widgets/agreement_links.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/widgets/login_app_bar.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/widgets/login_signup_button_divider.dart';
import 'package:flutter_skeleton/presentation/login_signup/signup/widgets/login_button.dart';
import 'package:flutter_skeleton/presentation/login_signup/signup/widgets/signup_button.dart';
import 'package:flutter_skeleton/utils/extensions/build_context_ext.dart';
import 'package:flutter_skeleton/utils/extensions/string.dart';
import 'package:loader_overlay/loader_overlay.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final AppLocalizations appLocalizations = context.localization;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(localizations: appLocalizations)
        ..add(EnableSignupModeEvent(isSignup: true)),
      child: const Scaffold(
        appBar: LoginAppBar(),
        bottomNavigationBar: AgreementLinks(),
        body: SafeArea(
          child: _SignupV2ScreenBody(),
        ),
      ),
    );
  }
}

class _SignupV2ScreenBody extends StatelessWidget {
  const _SignupV2ScreenBody();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) => _listenStateChanged(context, state),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.localization.login_signup_signup,
            style: AppTextStyles.h2Bold,
          ),
          const SizedBox(height: 30),
          const SignupButton(),
          const SizedBox(height: 30),
          const LoginSignUpButtonDivider(),
          const SizedBox(height: 20),
          const LoginButton(),
        ],
      ),
    );
  }

  void _listenStateChanged(BuildContext context, LoginState state) {
    if (state is AuthenticationExceptionState) {
      _showAuthenticationError(state, context);
    } else if (state is NavigateToHomeScreenState) {
      context.router.popUntilRoot();
    } else if (state is SSOLoginLoadingState) {
      if (state.isLoading) {
        context.loaderOverlay.show();
      } else {
        context.loaderOverlay.hide();
      }
    } else if (state is NavigateToChooseHandleState) {
      // TODO: navigate to choose handle
      // context.router.push(
      //   ChooseHandleRoute(loginBloc: context.loginV2Bloc),
      // );
    }
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
