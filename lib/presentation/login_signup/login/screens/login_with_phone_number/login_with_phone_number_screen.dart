import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/constants/constants.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_events.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_state.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/login_screen.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/screens/login_with_phone_number/widgets/heading_welcome_widget.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/screens/login_with_phone_number/widgets/login_options_divider.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/screens/login_with_phone_number/widgets/more_login_options_button.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/screens/login_with_phone_number/widgets/phone_number_text_field.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/screens/login_with_phone_number/widgets/send_otp_button.dart';
import 'package:flutter_skeleton/routes.gr.dart';
import 'package:flutter_skeleton/utils/extensions/build_context_ext.dart';
import 'package:flutter_skeleton/utils/extensions/string.dart';

@RoutePage()
class LoginWithPhoneNumberScreen extends StatefulWidget {
  const LoginWithPhoneNumberScreen({super.key});

  static const kHorizontalPadding = 16.0;

  @override
  State<LoginWithPhoneNumberScreen> createState() =>
      _LoginWithPhoneNumberScreenState();
}

class _LoginWithPhoneNumberScreenState
    extends State<LoginWithPhoneNumberScreen> {
  late final AppLocalizations appLocalizations = context.localization;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(
        localizations: appLocalizations,
      ),
      child: PopScope(
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            context.read<LoginBloc>().add(ResetPhoneNumberStateEvent());
            context
                .read<LoginBloc>()
                .add(ResetSignUpStateOnScreenClosedEvent());
          }
        },
        child: const Scaffold(
          // appBar: LoginAppBar(),
          body: _LoginWithPhoneNumberBody(),
        ),
      ),
    );
  }
}

class _LoginWithPhoneNumberBody extends StatelessWidget {
  const _LoginWithPhoneNumberBody();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) async {
        if (state is AuthenticationExceptionState) {
          _showAuthenticationError(state, context);
        } else if (state is NavigateToHomeScreenState) {
          await context.router.replace(const HomeRoute());
        } else if (state is SSOLoginLoadingState) {
          // if (state.isLoading) {
          //   context.loaderOverlay.show();
          // } else {
          //   context.loaderOverlay.hide();
          // }
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
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: LoginScreen.kHorizontalPadding,
          ),
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is NavigateToOTPScreenState &&
                  state.phoneOTPVerificationId.isNotEmpty) {
                context.pushRoute(
                  PhoneNumberOTPRoute(loginBloc: context.read<LoginBloc>()),
                );
              }
            },
            child: const Column(
              children: [
                SizedBox(height: 10),
                HeadingWelcomeWidget(),
                SizedBox(height: 30),
                PhoneNumberTextField(),
                SizedBox(height: 30),
                SendOTPButton(),
                SizedBox(height: 20),
                LoginOptionsDivider(),
                SizedBox(height: 20),
                MoreLoginOptionsButton(),
              ],
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
