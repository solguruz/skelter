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
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_style_enum.dart';
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
            shouldSetFullWidth: true,
            style: AppButtonStyle.outline,
            leftIcon: TablerIcons.mail,
            size: AppButtonSize.extraLarge,
            onPressed: () {
              context
                  .read<LoginBloc>()
                  .add(SelectLoginSignupTypeEvent(LoginType.EMAIL));
              context.pushRoute(
                LoginWithEmailPasswordRoute(
                  loginBloc: context.read<LoginBloc>(),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          AppButton(
            label: context.localization.login_signup_continue_with_google,
            shouldSetFullWidth: true,
            style: AppButtonStyle.outline,
            leftIconPath: Assets.icons.google.path,
            size: AppButtonSize.extraLarge,
            onPressed: () async {
              final isConnected =
                  InternetConnectivityHelper().onConnectivityChange.value;

              if (!isConnected && context.mounted) {
                context
                    .showSnackBar(context.localization.no_internet_connection);
                return;
              }
              context
                  .read<LoginBloc>()
                  .add(SelectLoginSignupTypeEvent(LoginType.GOOGLE));
              context.read<LoginBloc>().add(LoginWithGoogleEvent());
            },
          ),
          if (debugDefaultTargetPlatformOverride == TargetPlatform.iOS ||
              Theme.of(context).platform == TargetPlatform.iOS) ...[
            const SizedBox(height: 16),
            AppButton(
              label: context.localization.login_signup_continue_with_apple,
              shouldSetFullWidth: true,
              style: AppButtonStyle.outline,
              leftIconPath: Assets.icons.apple,
              size: AppButtonSize.extraLarge,
              onPressed: () async {
                final isConnected =
                    InternetConnectivityHelper().onConnectivityChange.value;

                if (!isConnected && context.mounted) {
                  context.showSnackBar(
                    context.localization.no_internet_connection,
                  );
                  return;
                }
                context
                    .read<LoginBloc>()
                    .add(SelectLoginSignupTypeEvent(LoginType.APPLE));
                context.read<LoginBloc>().add(LoginWithAppleEvent());
              },
            ),
          ],
          const SizedBox(height: 16),
          AppButton(
            label: isSignup
                ? context.localization.login_signup_login
                : context.localization.login_signup_sign_up,
            shouldSetFullWidth: true,
            style: AppButtonStyle.outline,
            size: AppButtonSize.extraLarge,
            onPressed: () async {
              context
                  .read<LoginBloc>()
                  .add(EnableSignupModeEvent(isSignup: !isSignup));
            },
          ),
        ],
      ),
    );
  }
}
