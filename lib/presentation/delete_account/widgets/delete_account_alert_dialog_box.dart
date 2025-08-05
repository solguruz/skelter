import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/delete_account/bloc/delete_account_bloc.dart';
import 'package:flutter_skeleton/presentation/delete_account/bloc/delete_account_event.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

Future<void> displayDeleteAccountAlertDialog(
  BuildContext context,
) async {
  await showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (ctx) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.warning_amber_rounded, color: AppColors.red),
            const SizedBox(width: 8),
            Text(
              context.localization.delete_account,
              style: AppTextStyles.p1SemiBold,
            ),
          ],
        ),
        content: Text(
          context.localization.delete_account_confirmation_message,
          style: AppTextStyles.p3Regular,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          AppButton(
            label: context.localization.cancel,
            size: AppButtonSize.medium,
            backgroundColor: AppColors.black,
            onPressed: () => Navigator.of(ctx).pop(),
          ),
          const SizedBox(width: 35),
          AppButton(
            label: context.localization.delete,
            size: AppButtonSize.medium,
            backgroundColor: AppColors.bgErrorDefault,
            onPressed: () {
              context
                  .read<DeleteAccountBloc>()
                  .add(const DeleteAccountSubmittedEvent());

              Navigator.of(ctx).pop();
            },
          ),
        ],
      );
    },
  );
}
