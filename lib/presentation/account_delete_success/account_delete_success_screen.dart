import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/gen/assets.gen.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/routes.gr.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter_svg/svg.dart';

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
        context.router.replaceAll([const LoginRoute()]);
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
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                SvgPicture.asset(
                  Assets.icons.accountDeletedSuccess,
                  height: 80,
                  width: 80,
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
                        style: AppTextStyles.p2Regular
                            .withColor(AppColors.textNeutralPrimary),
                      ),
                      const TextSpan(text: ' '),
                      TextSpan(
                        text: context.localization.login_signup_sign_up,
                        style: AppTextStyles.p2SemiBold
                            .withColor(AppColors.textBrandSecondary),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            await context.router.replaceAll([
                              const SignUpRoute(),
                            ]);
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
    );
  }
}
