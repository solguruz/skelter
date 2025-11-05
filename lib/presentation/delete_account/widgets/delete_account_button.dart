import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/delete_account/bloc/delete_account_bloc.dart';
import 'package:skelter/presentation/delete_account/enum/delete_account_reasons.dart';
import 'package:skelter/presentation/delete_account/widgets/delete_account_alert_bottom_sheet.dart';
import 'package:skelter/utils/extensions/build_context_ext.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:skelter/widgets/app_button/enums/app_button_state_enum.dart';

class DeleteAccountButton extends StatelessWidget {
  const DeleteAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLoading = context.select<DeleteAccountBloc, bool>(
      (bloc) => bloc.state.isLoading,
    );

    return AppButton(
      label: context.localization.delete_account,
      size: AppButtonSize.extraLarge,
      backgroundColor: context.currentTheme.bgErrorDefault,
      foregroundColor: context.currentTheme.textNeutralLight,
      shouldSetFullWidth: true,
      isLoading: isLoading,
      state: isLoading ? AppButtonState.disabled : AppButtonState.normal,
      onPressed: isLoading
          ? null
          : () async {
              FocusManager.instance.primaryFocus?.unfocus();

              final deleteAccountState =
                  context.read<DeleteAccountBloc>().state;
              final selectedReason = deleteAccountState.selectedReason;

              if (selectedReason == null) {
                context.showSnackBar(
                  context.localization.please_select_at_least_one_reason,
                );
                return;
              }

              if (selectedReason == DeleteAccountReasons.other &&
                  deleteAccountState.otherReasonText.isEmpty) {
                context.showSnackBar(
                  context.localization.please_specify_your_reason,
                );
                return;
              }

              await showDeleteAccountAlertBottomSheet(context);
            },
    );
  }
}
