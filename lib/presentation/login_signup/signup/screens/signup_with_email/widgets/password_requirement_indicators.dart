import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class PasswordRequirementIndicators extends StatelessWidget {
  const PasswordRequirementIndicators({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CharacterLengthRequirement(),
        SizedBox(height: 5),
        LetterAndNumberRequirement(),
        SizedBox(height: 10),
        SpecialCharacterRequirement(),
      ],
    );
  }
}

class CharacterLengthRequirement extends StatelessWidget {
  const CharacterLengthRequirement({super.key});

  @override
  Widget build(BuildContext context) {
    return _RequirementRow(
      isValid: context.select<LoginBloc, bool>(
        (bloc) => bloc.state.signupState?.isPasswordLongEnough ?? false,
      ),
      text: context.localization.login_signup_password_requirements_length,
    );
  }
}

class LetterAndNumberRequirement extends StatelessWidget {
  const LetterAndNumberRequirement({super.key});

  @override
  Widget build(BuildContext context) {
    return _RequirementRow(
      isValid: context.select<LoginBloc, bool>(
        (bloc) => bloc.state.signupState?.hasLetterAndNumberInPassword ?? false,
      ),
      text:
          context.localization.login_signup_password_requirements_letter_number,
    );
  }
}

class SpecialCharacterRequirement extends StatelessWidget {
  const SpecialCharacterRequirement({super.key});

  @override
  Widget build(BuildContext context) {
    return _RequirementRow(
      isValid: context.select<LoginBloc, bool>(
        (bloc) =>
            bloc.state.signupState?.hasSpecialCharacterInPassword ?? false,
      ),
      text:
          context.localization.login_signup_password_requirements_special_char,
    );
  }
}

class _RequirementRow extends StatelessWidget {
  const _RequirementRow({required this.isValid, required this.text});

  final bool isValid;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isValid ? TablerIcons.circle_check_filled : TablerIcons.circle_check,
          color:
              isValid ? AppColors.bgSuccessDefault : AppColors.iconNeutralHover,
          size: 20,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: AppTextStyles.p4Regular.withColor(
            isValid
                ? AppColors.textSuccessSecondary
                : AppColors.textNeutralSecondary,
          ),
        ),
      ],
    );
  }
}
