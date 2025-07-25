import 'dart:async';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fgbg/flutter_fgbg.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/gen/assets.gen.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_events.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_state.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/login_screen.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/widgets/login_app_bar.dart';
import 'package:flutter_skeleton/presentation/login_signup/signup/screens/verify_email_screen/widgets/entered_wrong_email.dart';
import 'package:flutter_skeleton/presentation/login_signup/signup/screens/verify_email_screen/widgets/resend_verification_mail_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, required this.loginBloc});

  final LoginBloc loginBloc;

  static const kResendVerificationEmailMaxSeconds = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LoginAppBar(removeLeading: true),
      body: BlocProvider<LoginBloc>.value(
        value: loginBloc,
        child: const _VerifyEmailScreenBody(),
      ),
    );
  }
}

class _VerifyEmailScreenBody extends StatefulWidget {
  const _VerifyEmailScreenBody();

  @override
  State<_VerifyEmailScreenBody> createState() => _VerifyEmailScreenBodyState();
}

class _VerifyEmailScreenBodyState extends State<_VerifyEmailScreenBody> {
  Timer? _verificationListenTimer, _resendVerificationMailTimer;

  // TODO: check this if it works:
  bool _isEmailVerified() =>
      FirebaseAuth.instance.currentUser?.emailVerified ?? false;

  @override
  void initState() {
    super.initState();
    _startTimerForVerificationListen();
    _startTimerForResendVerificationEmail();
  }

  @override
  Widget build(BuildContext context) {
    final email = context.read<LoginBloc>().state.isSignup
        ? context.read<LoginBloc>().state.signupState?.email ?? ''
        : context.read<LoginBloc>().state.emailPasswordLoginState?.email ?? '';

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is RestartVerificationMailResendTimerState) {
          _startTimerForResendVerificationEmail();
        } else if (state is VerificationCodeFailedToSendState) {
          _resendVerificationMailTimer?.cancel();
          context.read<LoginBloc>().add(
                ResendVerificationEmailTimeLeftEvent(
                  resendTimeLeft: 0,
                ),
              );
        }
      },
      child: FGBGNotifier(
        onEvent: (FGBGType type) {
          if (type == FGBGType.foreground) {
            checkIfEmailVerified(context);
          } else {
            _verificationListenTimer?.cancel();
          }
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: LoginScreen.kHorizontalPadding,
              right: LoginScreen.kHorizontalPadding,
              bottom: max(20, MediaQuery.of(context).padding.bottom),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.icons.emailNotification),
                const SizedBox(height: 18),
                Text(
                  context.localization.login_signup_verify_your_email,
                  style: AppTextStyles.h2Bold,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 18),
                // TODO: create a loading animation
                // prevent in test mode
                // Common().loadingLottieAnimation(),
                const SizedBox(height: 18),
                Text(
                  context.localization.login_signup_link_verify_info(email),
                  style: AppTextStyles.p2Medium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 25),
                const ResendVerificationMailButton(),
                const SizedBox(height: 16),
                const EnteredWrongEmail(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // TODO: refactor, this logic should be in bloc
  void checkIfEmailVerified(BuildContext context) async {
    _verificationListenTimer?.cancel();
    await FirebaseAuth.instance.currentUser?.reload();
    if (_isEmailVerified()) {
      context.read<LoginBloc>().add(
            ChangeUserDetailsInputStatusEvent(
              UserDetailsInputStatus.inProgress,
            ),
          );
      // TODO: add navigation
      if (context.read<LoginBloc>().state.isSignup) {
        //   context.router.popUntilRouteWithName(SignUpV2Route.name);
        //   await context.router
        //       .push(ChooseHandleRoute(loginBloc: context.loginV2Bloc));
        // } else {
        //   await context.router
        //       .replace(ChooseHandleRoute(loginBloc: context.loginV2Bloc));
      }
    } else {
      _startTimerForVerificationListen();
    }
  }

  void _startTimerForVerificationListen() {
    _verificationListenTimer =
        Timer.periodic(const Duration(seconds: 5), (timer) {
      checkIfEmailVerified(context);
    });
  }

  void _startTimerForResendVerificationEmail() {
    _resendVerificationMailTimer =
        Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      final timeLeft =
          VerifyEmailScreen.kResendVerificationEmailMaxSeconds - timer.tick;
      if (timeLeft >= 0) {
        context.read<LoginBloc>().add(
              ResendVerificationEmailTimeLeftEvent(
                resendTimeLeft: timeLeft,
              ),
            );
      }
    });
  }

  @override
  void dispose() {
    _verificationListenTimer?.cancel();
    _resendVerificationMailTimer?.cancel();
    super.dispose();
  }
}
