import 'package:flutter/material.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:skelter/widgets/app_button/enums/app_button_style_enum.dart';

class BackToLoginButton extends StatelessWidget {
  const BackToLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      label: context.localization.back_to_login,
      shouldSetFullWidth: true,
      style: AppButtonStyle.outline,
      size: AppButtonSize.large,
      onPressed: () {
        // TODO: navigate to login
      },
    );
  }
}
