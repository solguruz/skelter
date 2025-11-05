import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/gen/assets.gen.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/routes.gr.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

@RoutePage()
class AccountDeleteSuccessScreen extends StatefulWidget {
  const AccountDeleteSuccessScreen({super.key});

  @override
  State<AccountDeleteSuccessScreen> createState() =>
      _AccountDeleteSuccessScreenState();
}

class _AccountDeleteSuccessScreenState
    extends State<AccountDeleteSuccessScreen> {
  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();
    _scheduleNavigationToLogin();
  }

  void _scheduleNavigationToLogin() {
    _navigationTimer = Timer(const Duration(seconds: 5), () {
      if (mounted) {
        context.router.pushAndPopUntil(
          LoginWithPhoneNumberRoute(),
          predicate: (_) => false,
        );
      }
    });
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Transform.scale(
                    scale: 1.4,
                    child: Lottie.asset(
                      Assets.animations.successCheckmarkRedBg,
                      width: 80,
                      height: 80,
                      repeat: false,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    context.localization.account_deleted,
                    style: AppTextStyles.h4SemiBold,
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: AppTextStyles.p2Regular,
                      children: [
                        TextSpan(
                          text: context.localization.creating_new_account,
                          style: AppTextStyles.p2Regular.copyWith(
                            color: context.currentTheme.textNeutralPrimary,
                          ),
                        ),
                        const TextSpan(text: ' '),
                        TextSpan(
                          text: context.localization.sign_up,
                          style: AppTextStyles.p2SemiBold.copyWith(
                            color: context.currentTheme.textBrandSecondary,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              await context.router.pushAndPopUntil(
                                LoginWithPhoneNumberRoute(),
                                predicate: (_) => false,
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
