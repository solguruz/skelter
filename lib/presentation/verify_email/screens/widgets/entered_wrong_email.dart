import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/login/screens/login_with_phone_number/login_with_phone_number_screen.dart';
import 'package:skelter/presentation/verify_email/bloc/verify_email_bloc.dart';
import 'package:skelter/routes.gr.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class EnteredWrongEmail extends StatelessWidget {
  const EnteredWrongEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isSignup = context.select<VerifyEmailBloc, bool>(
      (bloc) => bloc.state.isSignUp,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: LoginWithPhoneNumberScreen.kHorizontalPadding,
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: AppTextStyles.p2Medium
              .copyWith(color: AppColors.textNeutralSecondary),
          children: [
            TextSpan(
              text: context.localization.entered_wrong_email,
            ),
            TextSpan(
              text: context.localization.change_email,
              style: AppTextStyles.p2Bold
                  .copyWith(color: AppColors.textBrandSecondary),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  if (isSignup) {
                    context.router.popUntil(
                      (route) =>
                          route.settings.name ==
                          SignupWithEmailPasswordRoute.name,
                    );
                  } else {
                    await context.router.maybePop();
                  }
                },
            ),
          ],
        ),
      ),
    );
  }
}
