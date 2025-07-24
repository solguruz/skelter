import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/constants/constants.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_state.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/widgets/agreement_links.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/widgets/login_app_bar.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/widgets/login_button.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/widgets/login_signup_button_divider.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/widgets/sign_up_button.dart';
import 'package:flutter_skeleton/routes.gr.dart';
import 'package:flutter_skeleton/utils/extensions/build_context_ext.dart';
import 'package:flutter_skeleton/utils/extensions/string.dart';
import 'package:loader_overlay/loader_overlay.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const kHorizontalPadding = 16.0;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final AppLocalizations appLocalizations = context.localization;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(
        localizations: appLocalizations,
      ),
      child: const Scaffold(
        appBar: LoginAppBar(),
        bottomNavigationBar: AgreementLinks(),
        body: SafeArea(
          child: _LoginScreenBody(),
        ),
      ),
    );
  }
}

class _LoginScreenBody extends StatelessWidget {
  const _LoginScreenBody();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) async {
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
          //TODO: add navigation
          // await context.router.push(
          //   ChooseHandleRoute(loginBloc: context.loginV2Bloc),
          // );
        } else if (state is NavigateToEmailVerifyScreenState) {
          await context.router.push(
            VerifyEmailRoute(loginBloc: context.read<LoginBloc>()),
          );
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.localization.login_signup_login_to_app,
            style: AppTextStyles.h2Bold,
          ),
          const SizedBox(height: 30),
          const LoginButton(),
          const SizedBox(height: 30),
          const LoginSignUpButtonDivider(),
          const SizedBox(height: 20),
          const SignUpButton(),
        ],
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
