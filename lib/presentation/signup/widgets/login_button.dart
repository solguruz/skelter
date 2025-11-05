import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/login/bloc/login_bloc.dart';
import 'package:skelter/presentation/login/bloc/login_events.dart';
import 'package:skelter/presentation/login/screens/login_with_phone_number/login_with_phone_number_screen.dart';
import 'package:skelter/routes.gr.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: LoginWithPhoneNumberScreen.kHorizontalPadding,
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: AppTextStyles.p2Medium
              .copyWith(color: context.currentTheme.textNeutralSecondary),
          children: [
            TextSpan(
              text: context.localization.already_have_account,
            ),
            TextSpan(
              text: context.localization.login,
              style: AppTextStyles.p2Bold
                  .copyWith(color: context.currentTheme.textBrandSecondary),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  context
                      .read<LoginBloc>()
                      .add(EnableSignupModeEvent(isSignup: false));
                  await context.router.replace(LoginWithPhoneNumberRoute());
                },
            ),
          ],
        ),
      ),
    );
  }
}
