import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/gen/assets.gen.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/login/bloc/login_bloc.dart';
import 'package:skelter/presentation/login/bloc/login_events.dart';
import 'package:skelter/presentation/login/enum/enum_login_type.dart';
import 'package:skelter/presentation/login/screens/login_with_phone_number/login_with_phone_number_screen.dart';
import 'package:skelter/routes.gr.dart';
import 'package:skelter/utils/extensions/build_context_ext.dart';
import 'package:skelter/utils/internet_connectivity_helper.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:skelter/widgets/app_button/enums/app_button_style_enum.dart';

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
        horizontal: LoginWithPhoneNumberScreen.kHorizontalPadding,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppButton(
            label: context.localization.login_continue_with_email,
            shouldSetFullWidth: true,
            style: AppButtonStyle.outline,
            leftIcon: TablerIcons.mail,
            size: AppButtonSize.extraLarge,
            onPressed: () {
              if (isSignup) {
                context.pushRoute(const SignupWithEmailPasswordRoute());
              } else {
                context
                    .read<LoginBloc>()
                    .add(SelectLoginSignupTypeEvent(LoginType.EMAIL));

                context.pushRoute(
                  LoginWithEmailPasswordRoute(
                    loginBloc: context.read<LoginBloc>(),
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 16),
          AppButton(
            label: context.localization.login_continue_with_google,
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
          if (Platform.isIOS) ...[
            const SizedBox(height: 16),
            AppButton(
              label: context.localization.login_continue_with_apple,
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
                ? context.localization.login
                : context.localization.signup_sign_up,
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
