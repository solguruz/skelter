import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/login_screen.dart';
import 'package:flutter_skeleton/routes.gr.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class EnteredWrongEmail extends StatelessWidget {
  const EnteredWrongEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: LoginScreen.kHorizontalPadding,
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style:
              AppTextStyles.p2Medium.withColor(AppColors.textNeutralSecondary),
          children: [
            TextSpan(
              text: context.localization.login_signup_entered_wrong_email,
            ),
            TextSpan(
              text: context.localization.login_signup_change_email,
              style:
                  AppTextStyles.p2Bold.withColor(AppColors.textBrandSecondary),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  if (context.read<LoginBloc>().state.isSignup) {
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
