import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/routes.gr.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';

class BackToHomeButton extends StatelessWidget {
  const BackToHomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      label: context.l10n.back_to_home,
      fillWidth: true,
      size: AppButtonSize.xl,
      onPressed: () {
        context.router.replaceAll([const HomeRoute()]);
      },
    );
  }
}
