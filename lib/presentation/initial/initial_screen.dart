import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/presentation/force_update/feature/force_update_constants.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/models/login_details.dart';
import 'package:flutter_skeleton/routes.gr.dart';
import 'package:flutter_skeleton/services/remote_config_service.dart';
import 'package:flutter_skeleton/shared_pref/pref_keys.dart';
import 'package:flutter_skeleton/shared_pref/prefs.dart';
import 'package:flutter_skeleton/utils/app_version_helper.dart';
import 'package:flutter_skeleton/utils/extensions/string.dart';
import 'package:package_info_plus/package_info_plus.dart';

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
      await context.router.replace(const LoginWithPhoneNumberRoute());
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
