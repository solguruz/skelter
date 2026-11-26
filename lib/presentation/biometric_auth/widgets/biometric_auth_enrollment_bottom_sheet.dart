import 'package:auto_route/auto_route.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:open_settings_plus/open_settings_plus.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/biometric_auth/enum/biometric_auth_enrollment_results.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:skelter/widgets/app_button/enums/app_button_style_enum.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

Future<BiometricEnrollmentResult?> showBiometricSetupEnrollmentBottomSheet(
  BuildContext context,
) async {
  return await showModalBottomSheet<BiometricEnrollmentResult>(
    context: context,
    backgroundColor: AppColors.transparent,
    isScrollControlled: true,
    isDismissible: false,
    builder: (ctx) {
      return Container(
        padding: const EdgeInsets.only(
          top: 24,
          left: 16,
          right: 16,
          bottom: 16,
        ),
        decoration: BoxDecoration(
          color: context.currentTheme.bgSurfaceBase2,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: .min,
          children: [
            Container(
              height: 56,
              width: 56,
              decoration: const BoxDecoration(
                color: AppColors.white,
                shape: .circle,
              ),
              child: Center(
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: AppColors.brand100,
                    shape: .circle,
                  ),
                  child: Icon(
                    TablerIcons.fingerprint,
                    size: 24,
                    color: context.currentTheme.iconBrandHover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              context.localization.biometric_authentication,
              style: AppTextStyles.h6SemiBold.copyWith(
                color: context.currentTheme.textNeutralPrimary,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              context.localization.biometric_auth_desc_for_enrollment,
              textAlign: .center,
              style: AppTextStyles.p3Regular.copyWith(
                color: context.currentTheme.textNeutralSecondary,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    onPressed: () {
                      context.router.pop(BiometricEnrollmentResult.cancel);
                    },
                    foregroundColor: context.currentTheme.textNeutralPrimary,
                    backgroundColor: context.currentTheme.bgSurfaceBase2,
                    style: AppButtonStyle.outline,
                    label: context.localization.cancel,
                    size: AppButtonSize.extraLarge,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AppButton(
                    onPressed: () async {
                      context.router.pop(BiometricEnrollmentResult.settings);
                      await _openBiometricSettings();
                    },
                    label: context.localization.go_to_settings,
                    size: AppButtonSize.extraLarge,
                    foregroundColor: context.currentTheme.textNeutralLight,
                    backgroundColor: context.currentTheme.bgBrandDefault,
                    paddingOverride: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      );
    },
  );
}

Future<void> _openBiometricSettings() async {
  switch (OpenSettingsPlus.shared) {
    case final OpenSettingsPlusAndroid settings:
      await settings.biometricEnroll();
    case final OpenSettingsPlusIOS settings:
      await settings.faceIDAndPasscode();
    case null:
      throw Exception('Platform not supported');
  }
}
