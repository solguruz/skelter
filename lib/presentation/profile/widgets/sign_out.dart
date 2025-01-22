import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/app_icons/app_icon.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/core/app_sizes.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/routes.gr.dart';
import 'package:flutter_skeleton/shared_pref/prefs.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class SignOut extends StatelessWidget {
  const SignOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.strokeNeutralLight200),
        borderRadius: BorderRadius.circular(AppRadius.M),
      ),
      child: ListTile(
        leading: const AppIcon(
          iconData: TablerIcons.arrow_left_from_arc,
        ),
        title: Text(
          context.l10n.sign_out,
          style: AppTextStyles.h6SemiBold,
        ),
        trailing: const AppIcon(
          iconData: TablerIcons.chevron_right,
        ),
        onTap: () async {
          await Prefs.clear();
          await FirebaseAuth.instance.signOut();
          await context.router.replace(const LoginWithPhoneNumberRoute());
        },
      ),
    );
  }
}
