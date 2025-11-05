import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/gen/assets.gen.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/utils/internet_connectivity_helper.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:skelter/widgets/app_button/enums/app_button_style_enum.dart';

@RoutePage()
class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.icons.noInternetConnection,
                    height: 195,
                    width: 195,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    context.localization.lost_connection,
                    style: AppTextStyles.p1SemiBold.copyWith(
                      color: context.currentTheme.textNeutralPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    context.localization.lost_connection_message,
                    style: AppTextStyles.p3Regular.copyWith(
                      color: context.currentTheme.textNeutralSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  AppButton(
                    label: context.localization.try_again,
                    foregroundColor: context.currentTheme.textBrandSecondary,
                    onPressed: () {
                      final isConnected = InternetConnectivityHelper()
                          .onConnectivityChange
                          .value;
                      if (isConnected) {
                        context.router.maybePop();
                      }
                    },
                    size: AppButtonSize.extraLarge,
                    style: AppButtonStyle.secondary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
