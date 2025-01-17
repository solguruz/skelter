import 'package:flutter_skeleton/analytics/analytics_events.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/analytics_helper.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter/material.dart';

class NextCTA extends StatelessWidget {
  const NextCTA({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      label: context.l10n.login_signup_next,
      fillWidth: true,
      size: AppButtonSize.l,
      onPressed: () {
        AnalyticsHelper().logCustomEvent(
          DebugSignUpAnalyticsEvents.kTapPhoneNumVerifiedNext,
        );
        // TODO: add navigation
        // context.router
        //     .replace(ChooseHandleRoute(loginBloc: context.loginV2Bloc));
      },
    );
  }
}
