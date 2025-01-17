import 'package:auto_route/auto_route.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/routes.gr.dart';
import 'package:flutter_skeleton/shared_pref/prefs.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      label: context.l10n.logout,
      size: AppButtonSize.l,
      onPressed: () async {
        await Prefs.clear();
        await FirebaseAuth.instance.signOut();
        await context.router.replace(const LoginWithPhoneNumberRoute());
      },
    );
  }
}
