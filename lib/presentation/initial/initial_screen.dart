import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:skelter/presentation/force_update/constants/force_update_constants.dart';
import 'package:skelter/presentation/login/models/login_details.dart';
import 'package:skelter/routes.gr.dart';
import 'package:skelter/services/remote_config_service.dart';
import 'package:skelter/shared_pref/pref_keys.dart';
import 'package:skelter/shared_pref/prefs.dart';
import 'package:skelter/utils/app_version_helper.dart';
import 'package:skelter/utils/extensions/string.dart';

@RoutePage()
class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  Future<void> _checkForceUpdateAndAuthStatus() async {
    final remoteConfig = RemoteConfigService();

    final appCurrentVersion = (await PackageInfo.fromPlatform()).version;

    final currentAppVersion = getExtendedVersionNumber(appCurrentVersion);
    final latestAppVersion = getExtendedVersionNumber(
      remoteConfig.getString(kRemoteConfigAppLatestVersionKey),
    );
    final minimumRequiredVersion = getExtendedVersionNumber(
      remoteConfig.getString(kRemoteConfigMandatoryAppVersionKey),
    );

    final isMandatoryUpdateRequired =
        currentAppVersion < minimumRequiredVersion;
    final isOptionalUpdateAvailable = currentAppVersion < latestAppVersion;

    if (isMandatoryUpdateRequired) {
      await context.router.replaceAll([
        ForceUpdateRoute(isMandatoryUpdate: true),
      ]);
      return;
    }

    if (isOptionalUpdateAvailable) {
      await showOptionalUpdate(context: context);
    }

    await _checkAuthStatus(context);
  }

  Future<void> _checkAuthStatus(BuildContext context) async {
    final userDetailsJson = await Prefs.getString(PrefKeys.kUserDetails);
    final userDetails = LoginDetails.fromJson(
      json.decode(userDetailsJson ?? '{}'),
    );

    if ((userDetails.uid ?? '').haveContent()) {
      await context.router.replace(const HomeRoute());
    } else {
      await context.router.replace(LoginWithPhoneNumberRoute());
    }
  }

  Future<void> showOptionalUpdate({
    required BuildContext context,
  }) async {
    final dateTimeNow = DateTime.now();

    final lastShownUpdatePromptTimeStamp =
        await Prefs.getInt(kLastShownUpdatePromptTimestamp);

    final lastShownUpdateTime = lastShownUpdatePromptTimeStamp != null
        ? DateTime.fromMillisecondsSinceEpoch(lastShownUpdatePromptTimeStamp)
        : null;

    final hasNeverBeenShown = lastShownUpdateTime == null;
    final cooldownTimePassed = lastShownUpdateTime != null &&
        dateTimeNow.difference(lastShownUpdateTime) >=
            kOptionalUpdateCooldownTime;

    final shouldShowUpdatePrompt = hasNeverBeenShown || cooldownTimePassed;

    if (shouldShowUpdatePrompt) {
      await Prefs.setInt(
        kLastShownUpdatePromptTimestamp,
        dateTimeNow.millisecondsSinceEpoch,
      );

      await context.router.push(
        ForceUpdateRoute(isMandatoryUpdate: false),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _checkForceUpdateAndAuthStatus();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SizedBox.shrink());
  }
}
