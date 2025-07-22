import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/gen/assets.gen.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';

class HeadingWelcomeWidget extends StatelessWidget {
  const HeadingWelcomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSignup = context.select<LoginBloc, bool>(
      (bloc) => bloc.state.isSignup,
    );

    return Column(
      children: [
        const SizedBox(height: 16),
        Image.asset(
          Assets.icons.icon.path,
          width: 100,
          height: 56,
        ),
        const SizedBox(height: 16),
        Text(
          isSignup
              ? context.localization.login_signup_signup_lets_get_started
              : context.localization.login_signup_welcome_back,
          style: AppTextStyles.h2Bold,
          textAlign: TextAlign.center,
        ),
        Text(
          isSignup
              ? context.localization.login_signup_signup_lets_get_started_info
              : context
                  .localization.login_signup_enter_your_registered_phone_number,
          style: AppTextStyles.p2Regular,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
