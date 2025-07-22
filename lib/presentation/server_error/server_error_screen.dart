import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/gen/assets.gen.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_style_enum.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class ServerErrorScreen extends StatelessWidget {
  const ServerErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.icons.serverError,
                height: 150,
                width: 150,
              ),
              const SizedBox(height: 24),
              Text(
                context.localization.server_error_title,
                style: AppTextStyles.p1SemiBold,
              ),
              const SizedBox(height: 8),
              Text(
                context.localization.server_error_description,
                style: AppTextStyles.p3Regular,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      label: context.localization.try_again,
                      onPressed: () {},
                      size: AppButtonSize.extraLarge,
                      style: AppButtonStyle.secondary,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: AppButton(
                      label: context.localization.back_to_home,
                      onPressed: () {},
                      size: AppButtonSize.extraLarge,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
