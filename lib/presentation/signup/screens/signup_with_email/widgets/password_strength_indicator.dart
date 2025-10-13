import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/presentation/signup/bloc/signup_bloc.dart';
import 'package:skelter/utils/extensions/primitive_types_extensions.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class PasswordStrengthProgressIndicator extends StatelessWidget {
  const PasswordStrengthProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final String password =
        context.select<SignupBloc, String>((bloc) => bloc.state.password);

    final int passwordStrengthLevel = context
        .select<SignupBloc, int>((bloc) => bloc.state.passwordStrengthLevel);

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
