import 'dart:async';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fgbg/flutter_fgbg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/gen/assets.gen.dart';
import 'package:skelter/i18n/app_localizations.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/login/screens/login_with_phone_number/login_with_phone_number_screen.dart';
import 'package:skelter/presentation/login/widgets/login_app_bar.dart';
import 'package:skelter/presentation/signup/enum/user_details_input_status.dart';
import 'package:skelter/presentation/verify_email/bloc/verify_email_bloc.dart';
import 'package:skelter/presentation/verify_email/bloc/verify_email_event.dart';
import 'package:skelter/presentation/verify_email/bloc/verify_email_state.dart';
import 'package:skelter/presentation/verify_email/screens/widgets/entered_wrong_email.dart';
import 'package:skelter/presentation/verify_email/screens/widgets/resend_verification_mail_button.dart';
import 'package:skelter/routes.gr.dart';

@RoutePage()
class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({
    super.key,
    required this.email,
    this.isSignUp = false,
  });

  final bool isSignUp;

  final String email;

  static const kResendVerificationEmailMaxSeconds = 30;

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  late final AppLocalizations appLocalizations = context.localization;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LoginAppBar(),
      body: BlocProvider(
        create: (context) => VerifyEmailBloc(localizations: appLocalizations)
          ..add(
            InitialEvent(
              email: widget.email,
              isSignUp: widget.isSignUp,
            ),
          ),
        child: _VerifyEmailScreenBody(
          email: widget.email,
          isSignUp: widget.isSignUp,
        ),
      ),
    );
  }
}

class _VerifyEmailScreenBody extends StatefulWidget {
  const _VerifyEmailScreenBody({required this.email, required this.isSignUp});

  final bool isSignUp;
  final String email;

  @override
  State<_VerifyEmailScreenBody> createState() => _VerifyEmailScreenBodyState();
}

class _VerifyEmailScreenBodyState extends State<_VerifyEmailScreenBody> {
  Timer? _verificationListenTimer, _resendVerificationMailTimer;

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
    return BlocListener<VerifyEmailBloc, VerifyEmailState>(
      listener: (context, state) async {
        if (state is RestartVerificationMailResendTimerState) {
          _startTimerForResendVerificationEmail();
        } else if (state is VerificationCodeFailedToSendState) {
          _resendVerificationMailTimer?.cancel();
          context.read<VerifyEmailBloc>().add(
                const ResendVerificationEmailTimeLeftEvent(resendTimeLeft: 0),
              );
        } else if (state is NavigateToHomeState) {
          await context.router.replace(const HomeRoute());
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
              left: LoginWithPhoneNumberScreen.kHorizontalPadding,
              right: LoginWithPhoneNumberScreen.kHorizontalPadding,
              bottom: max(20, MediaQuery.of(context).padding.bottom),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.icons.emailNotification),
                const SizedBox(height: 18),
                Text(
                  context.localization.verify_your_email,
                  style: AppTextStyles.h2Bold,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 18),
                Text(
                  context.localization.link_verify_info(
                    widget.email,
                  ),
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

  void checkIfEmailVerified(BuildContext context) async {
    _verificationListenTimer?.cancel();
    await FirebaseAuth.instance.currentUser?.reload();
    if (_isEmailVerified()) {
      context.read<VerifyEmailBloc>().add(
            const ChangeUserDetailsInputStatusEvent(
              status: UserDetailsInputStatus.inProgress,
            ),
          );
      if (widget.isSignUp) {
        await context.read<VerifyEmailBloc>().storeLoginDetailsInPrefs(
              FirebaseAuth.instance.currentUser,
            );
        context.read<VerifyEmailBloc>().add(NavigateToHomeEvent());
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
    if (!mounted) return;
    _resendVerificationMailTimer =
        Timer.periodic(const Duration(seconds: 1), (timer) {
      final timeLeft =
          VerifyEmailScreen.kResendVerificationEmailMaxSeconds - timer.tick;
      if (timeLeft >= 0) {
        context.read<VerifyEmailBloc>().add(
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
