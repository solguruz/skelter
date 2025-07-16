import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/login_screen.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class AgreementLinks extends StatelessWidget {
  const AgreementLinks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: LoginScreen.kHorizontalPadding,
        right: LoginScreen.kHorizontalPadding,
        top: 8,
        bottom: max(8, MediaQuery.of(context).padding.bottom),
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style:
              AppTextStyles.p4Medium.withColor(AppColors.textNeutralSecondary),
          children: [
            TextSpan(text: context.localization.login_signup_agreement_info),
            TextSpan(
              text: context.localization.login_signup_terms_and_conditions,
              style: AppTextStyles.p4Bold
                  .withColor(AppColors.textNeutralSecondary)
                  .withDecoration(TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // TODO: open terms and conditions
                },
            ),
            TextSpan(text: ' ${context.localization.login_signup_and} '),
            TextSpan(
              text: context.localization.login_signup_privacy_policy,
              style: AppTextStyles.p4Bold
                  .withColor(AppColors.textNeutralSecondary)
                  .withDecoration(TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // TODO: open privacy policy
                },
            ),
            const TextSpan(text: '.'),
          ],
        ),
      ),
    );
  }
}
