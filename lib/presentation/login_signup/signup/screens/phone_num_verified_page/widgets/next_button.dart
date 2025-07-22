import 'package:flutter/material.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_size_enum.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      label: context.localization.login_signup_next,
      shouldSetFullWidth: true,
      size: AppButtonSize.large,
      onPressed: () {},
    );
  }
}
