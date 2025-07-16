import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/gen/assets.gen.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/enum_login_type.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_events.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/login_screen.dart';
import 'package:flutter_skeleton/routes.gr.dart';
import 'package:flutter_skeleton/utils/extensions/build_context_ext.dart';
import 'package:flutter_skeleton/utils/internet_connectivity_helper.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class MoreLoginOptionsButton extends StatelessWidget {
  const MoreLoginOptionsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSignup = context.select<LoginBloc, bool>(
      (bloc) => bloc.state.isSignup,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: LoginScreen.kHorizontalPadding,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppButton(
            label: context.localization.login_signup_continue_with_email,
            fillWidth: true,
            style: AppButtonStyle.outline,
            leftIconData: TablerIcons.mail,
            size: AppButtonSize.xl,
            onPressed: () {
              context.loginBloc
                  .add(SelectLoginSignupTypeEvent(LoginType.EMAIL));
              context.pushRoute(
                LoginWithEmailPasswordRoute(
                  loginBloc: context.loginBloc,
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          AppButton(
            label: context.localization.login_signup_continue_with_google,
            fillWidth: true,
            style: AppButtonStyle.outline,
            leftAppIcon: Assets.icons.google.path,
            size: AppButtonSize.xl,
            onPressed: () async {
              final isConnected =
                  InternetConnectivityHelper().onConnectivityChange.value;

              if (!isConnected && context.mounted) {
                context
                    .showSnackBar(context.localization.no_internet_connection);
                return;
              }
              context.loginBloc
                  .add(SelectLoginSignupTypeEvent(LoginType.GOOGLE));
              context.loginBloc.add(LoginWithGoogleEvent());
            },
          ),
          if (debugDefaultTargetPlatformOverride == TargetPlatform.iOS ||
              Theme.of(context).platform == TargetPlatform.iOS) ...[
            const SizedBox(height: 16),
            AppButton(
              label: context.localization.login_signup_continue_with_apple,
              fillWidth: true,
              style: AppButtonStyle.outline,
              leftAppIcon: Assets.icons.apple,
              size: AppButtonSize.xl,
              onPressed: () async {
                final isConnected =
                    InternetConnectivityHelper().onConnectivityChange.value;

                if (!isConnected && context.mounted) {
                  context.showSnackBar(
                      context.localization.no_internet_connection);
                  return;
                }
                context.loginBloc
                    .add(SelectLoginSignupTypeEvent(LoginType.APPLE));
                context.loginBloc.add(LoginWithAppleEvent());
              },
            ),
          ],
          const SizedBox(height: 16),
          AppButton(
            label: isSignup
                ? context.localization.login_signup_login
                : context.localization.login_signup_sign_up,
            fillWidth: true,
            style: AppButtonStyle.outline,
            size: AppButtonSize.xl,
            onPressed: () async {
              context.loginBloc.add(EnableSignupModeEvent(isSignup: !isSignup));
            },
          ),
        ],
      ),
    );
  }
}
