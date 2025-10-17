import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
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
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:skelter/widgets/app_button/enums/app_button_style_enum.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: LoginWithPhoneNumberScreen.kHorizontalPadding,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppButton(
            label: context.localization.continue_with_google,
            shouldSetFullWidth: true,
            style: AppButtonStyle.outline,
            leftIconPath: Assets.icons.icon.path,
            size: AppButtonSize.large,
            onPressed: () {
              context
                  .read<LoginBloc>()
                  .add(SelectLoginSignupTypeEvent(LoginType.GOOGLE));
              context.read<LoginBloc>().add(LoginWithGoogleEvent());
            },
          ),
          const SizedBox(height: 16),
          if (debugDefaultTargetPlatformOverride == TargetPlatform.iOS ||
              Theme.of(context).platform == TargetPlatform.iOS) ...[
            AppButton(
              label: context.localization.continue_with_apple,
              shouldSetFullWidth: true,
              style: AppButtonStyle.outline,
              leftIconPath: Assets.icons.apple,
              size: AppButtonSize.large,
              onPressed: () {
                context
                    .read<LoginBloc>()
                    .add(SelectLoginSignupTypeEvent(LoginType.APPLE));
                context.read<LoginBloc>().add(LoginWithAppleEvent());
              },
            ),
            const SizedBox(height: 16),
          ],
          AppButton(
            label: context.localization.continue_with_number,
            shouldSetFullWidth: true,
            style: AppButtonStyle.outline,
            leftIcon: TablerIcons.device_mobile,
            size: AppButtonSize.large,
            onPressed: () {
              context
                  .read<LoginBloc>()
                  .add(SelectLoginSignupTypeEvent(LoginType.PHONE));
              context.pushRoute(
                LoginWithPhoneNumberRoute(),
              );
            },
          ),
          const SizedBox(height: 16),
          AppButton(
            label: context.localization.continue_with_email,
            shouldSetFullWidth: true,
            style: AppButtonStyle.outline,
            leftIcon: TablerIcons.mail,
            size: AppButtonSize.large,
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
        ],
      ),
    );
  }
}
