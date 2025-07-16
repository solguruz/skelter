import 'package:flutter/material.dart';
import 'package:flutter_skeleton/presentation/settings/widgets/account_and_privacy.dart';
import 'package:flutter_skeleton/presentation/settings/widgets/change_password.dart';
import 'package:flutter_skeleton/presentation/settings/widgets/choose_app_theme.dart';
import 'package:flutter_skeleton/presentation/settings/widgets/divider.dart';
import 'package:flutter_skeleton/presentation/settings/widgets/notification_settings.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.strokeNeutralLight200),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: const Column(
            children: [
              NotificationSettings(),
              SettingsSectionDivider(),
              ChangePassword(),
              SettingsSectionDivider(),
              ChooseAppTheme(),
              SettingsSectionDivider(),
              AccountAndPrivacy(),
            ],
          ),
        ),
      ],
    );
  }
}
