import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/utils/extensions/string.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class PasswordStrengthStatus extends StatelessWidget {
  const PasswordStrengthStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final String password = context.select<LoginBloc, String>(
      (bloc) => bloc.state.signupState?.password ?? '',
    );

    final int passwordStrengthLevel = context.select<LoginBloc, int>(
      (bloc) => bloc.state.signupState?.passwordStrengthLevel ?? 0,
    );

    late final String strengthLabel;

    switch (passwordStrengthLevel) {
      case 3:
        strengthLabel = context.localization.login_signup_strong;
      case 2:
        strengthLabel = context.localization.login_signup_weak;
      default:
        strengthLabel = password.haveContent()
            ? context.localization.login_signup_poor
            : '';
    }
    return Row(
      children: [
        Text(
          context.localization.login_signup_password_strength,
          style: AppTextStyles.p4Medium.withColor(
            AppColors.textNeutralSecondary,
          ),
        ),
        Text(
          ' $strengthLabel',
          style: AppTextStyles.p4Bold.withColor(
            AppColors.textNeutralSecondary,
          ),
        ),
      ],
    );
  }
}
