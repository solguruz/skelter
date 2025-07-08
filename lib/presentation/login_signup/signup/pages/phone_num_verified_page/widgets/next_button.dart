import 'package:flutter/material.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      label: context.l10n.login_signup_next,
      fillWidth: true,
      size: AppButtonSize.l,
      onPressed: () {
        // TODO: add navigation
        // context.router
        //     .replace(ChooseHandleRoute(loginBloc: context.loginV2Bloc));
      },
    );
  }
}
