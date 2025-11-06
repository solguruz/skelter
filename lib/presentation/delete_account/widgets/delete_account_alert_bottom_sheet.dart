import 'package:auto_route/auto_route.dart';
import 'package:clarity_flutter/clarity_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/delete_account/bloc/delete_account_bloc.dart';
import 'package:skelter/presentation/delete_account/bloc/delete_account_event.dart';
import 'package:skelter/presentation/delete_account/constants/analytics_constant.dart';
import 'package:skelter/utils/extensions/build_context_ext.dart';
import 'package:skelter/utils/internet_connectivity_helper.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:skelter/widgets/app_button/enums/app_button_style_enum.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

Future<void> showDeleteAccountAlertBottomSheet(BuildContext context) async {
  await showModalBottomSheet<void>(
    context: context,
    backgroundColor: AppColors.transparent,
    isScrollControlled: true,
    builder: (ctx) {
      return Container(
        padding: const EdgeInsets.only(
          top: 20,
          left: 16,
          right: 16,
          bottom: 16,
        ),
        decoration: BoxDecoration(
          color: context.currentTheme.bgSurfaceBase2,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 56,
              width: 56,
              decoration: const BoxDecoration(
                color: AppColors.redError50,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: context.currentTheme.bgErrorLight100,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    TablerIcons.trash,
                    size: 24,
                    color: AppColors.redError500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              context.localization.delete_account_alert_title,
              style: AppTextStyles.h6SemiBold.copyWith(
                color: context.currentTheme.textNeutralPrimary,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                context.localization.delete_account_confirmation_message,
                textAlign: TextAlign.center,
                style: AppTextStyles.p3Regular.copyWith(
                  color: context.currentTheme.textNeutralSecondary,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    onPressed: () => context.router.pop(),
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
                    onPressed: () {
                      final isConnected = InternetConnectivityHelper()
                          .onConnectivityChange
                          .value;

                      if (!isConnected && context.mounted) {
                        context.showSnackBar(
                          context.localization.no_internet_connection,
                        );
                        return;
                      }
                      Clarity.sendCustomEvent(
                        kClarityEventDeleteAccountConfirmed,
                      );
                      context
                          .read<DeleteAccountBloc>()
                          .add(const DeleteAccountSubmittedEvent());
                      context.router.pop();
                    },
                    label: context.localization.delete,
                    size: AppButtonSize.extraLarge,
                    foregroundColor: context.currentTheme.textNeutralLight,
                    backgroundColor: context.currentTheme.bgErrorDefault,
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
