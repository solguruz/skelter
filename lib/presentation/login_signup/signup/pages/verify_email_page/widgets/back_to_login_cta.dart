import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter/material.dart';

class BackToLoginCTA extends StatelessWidget {
  const BackToLoginCTA({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      label: context.l10n.login_signup_back_to_login,
      fillWidth: true,
      style: AppButtonStyle.outline,
      size: AppButtonSize.l,
      onPressed: () {
        // TODO: navigate to login
      },
    );
  }
}
