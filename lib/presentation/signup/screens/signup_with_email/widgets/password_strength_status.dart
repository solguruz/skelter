import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/signup/bloc/signup_bloc.dart';
import 'package:skelter/utils/extensions/string.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class PasswordStrengthStatus extends StatelessWidget {
  const PasswordStrengthStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final String password =
        context.select<SignupBloc, String>((bloc) => bloc.state.password);

    final int passwordStrengthLevel = context
        .select<SignupBloc, int>((bloc) => bloc.state.passwordStrengthLevel);

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
