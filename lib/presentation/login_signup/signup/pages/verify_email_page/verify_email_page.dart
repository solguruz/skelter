import 'dart:async';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fgbg/flutter_fgbg.dart';
import 'package:flutter_skeleton/analytics/analytics_events.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/gen/assets.gen.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/analytics_helper.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_events.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_state.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/login_page.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/widgets/login_app_bar.dart';
import 'package:flutter_skeleton/presentation/login_signup/signup/pages/verify_email_page/widgets/entered_wrong_email.dart';
import 'package:flutter_skeleton/presentation/login_signup/signup/pages/verify_email_page/widgets/resend_verification_mail_cta.dart';
import 'package:flutter_skeleton/utils/extensions/build_context_ext.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key, required this.loginBloc});

  final LoginBloc loginBloc;

  static const kResendVerificationEmailMaxSeconds = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LoginAppBar(removeLeading: true),
      body: BlocProvider<LoginBloc>.value(
        value: loginBloc,
        child: const _VerifyEmailPageBody(),
      ),
    );
  }
}

class _VerifyEmailPageBody extends StatefulWidget {
  const _VerifyEmailPageBody();

  @override
  State<_VerifyEmailPageBody> createState() => _VerifyEmailPageBodyState();
}

class _VerifyEmailPageBodyState extends State<_VerifyEmailPageBody> {
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
    final email = context.loginBloc.state.isSignup
        ? context.loginBloc.state.signupState?.email ?? ''
        : context.loginBloc.state.emailPasswordLoginState?.email ?? '';

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is RestartVerificationMailResendTimerState) {
          _startTimerForResendVerificationEmail();
        } else if (state is VerificationCodeFailedToSendState) {
          _resendVerificationMailTimer?.cancel();
          context.loginBloc.add(
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
        child: PopScope(
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) {
              AnalyticsHelper().logCustomEvent(
                DebugSignUpAnalyticsEvents.kEmailVerifyPageOnBackPressed,
              );
            }
          },
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                left: LoginPage.kHorizontalPadding,
                right: LoginPage.kHorizontalPadding,
                bottom: max(20, context.screenPaddingBottom),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(Assets.icons.emailNotification),
                  const SizedBox(height: 18),
                  Text(
                    context.l10n.login_signup_verify_your_email,
                    style: AppTextStyles.h2Bold,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 18),
                  // TODO: create a loading animation
                  // prevent in test mode
                  // Common().loadingLottieAnimation(),
                  const SizedBox(height: 18),
                  Text(
                    context.l10n.login_signup_link_verify_info(email),
                    style: AppTextStyles.p2Medium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25),
                  const ResendVerificationMailCTA(),
                  const SizedBox(height: 16),
                  const EnteredWrongEmail(),
                ],
              ),
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
      context.loginBloc.add(
        ChangeUserDetailsInputStatusEvent(UserDetailsInputStatus.inProgress),
      );
      // TODO: add navigation
      if (context.loginBloc.state.isSignup) {
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
          VerifyEmailPage.kResendVerificationEmailMaxSeconds - timer.tick;
      if (timeLeft >= 0) {
        context.loginBloc.add(
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
