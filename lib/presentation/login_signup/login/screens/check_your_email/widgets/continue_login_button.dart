import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_size_enum.dart';

class ContinueLoginButton extends StatelessWidget {
  const ContinueLoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      label: context.localization.login_signup_continue,
      shouldSetFullWidth: true,
      size: AppButtonSize.large,
      onPressed: () {
        context.maybePop();
      },
    );
  }
}
