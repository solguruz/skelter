import 'dart:io';

import 'package:flutter/material.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/force_update/constants/force_update_constants.dart';
import 'package:skelter/utils/extensions/build_context_ext.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateNowButton extends StatelessWidget {
  const UpdateNowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      label: context.localization.update_now,
      shouldSetFullWidth: true,
      size: AppButtonSize.extraLarge,
      onPressed: () async {
        await _launchAppStore(context);
      },
    );
  }

  Future<void> _launchAppStore(BuildContext context) async {
    Uri url;

    if (Platform.isIOS) {
      url = Uri.parse(kAppStoreBaseUrl);
    } else if (Platform.isAndroid) {
      url = Uri.parse(kPlayStoreBaseUrl);
    } else {
      context.showSnackBar(context.localization.platform_not_supported);
      return;
    }

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      context.showSnackBar(context.localization.could_not_launch_store_link);
    }
  }
}
