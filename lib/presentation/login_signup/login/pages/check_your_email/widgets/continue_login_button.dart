import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';

class ContinueLoginButton extends StatelessWidget {
  const ContinueLoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      label: context.l10n.login_signup_continue,
      fillWidth: true,
      size: AppButtonSize.l,
      onPressed: () {
        context.maybePop();
      },
    );
  }
}
