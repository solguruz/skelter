import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/utils/extensions/string.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class PasswordStrengthProgressIndicator extends StatelessWidget {
  const PasswordStrengthProgressIndicator({
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

    double progressValue = passwordStrengthLevel / 3;

    if (progressValue == 0 && password.haveContent()) {
      progressValue = 1 / 3;
    }

    late final Color progressColor;

    switch (progressValue) {
      case 1.0:
        progressColor = AppColors.bgBrandDefault;
      case >= 0.66:
        progressColor = AppColors.bgWarningDefault;
      default:
        progressColor = AppColors.bgNeutralDefault;
    }

    return LinearProgressIndicator(
      minHeight: 1.5,
      color: progressColor,
      backgroundColor: AppColors.bgNeutralLight100,
      value: progressValue,
    );
  }
}
