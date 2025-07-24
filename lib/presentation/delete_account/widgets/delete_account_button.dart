import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/delete_account/bloc/delete_account_bloc.dart';
import 'package:flutter_skeleton/presentation/delete_account/bloc/delete_account_event.dart';
import 'package:flutter_skeleton/utils/extensions/build_context_ext.dart';
import 'package:flutter_skeleton/utils/internet_connectivity_helper.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_state_enum.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

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
      backgroundColor: AppColors.bgErrorDefault,
      shouldSetFullWidth: true,
      state: isLoading ? AppButtonState.disabled : AppButtonState.normal,
      onPressed: isLoading
          ? null
          : () async {
              final isConnected =
                  InternetConnectivityHelper().onConnectivityChange.value;

              if (!isConnected && context.mounted) {
                context.showSnackBar(
                  context.localization.no_internet_connection,
                );
                return;
              }

              context
                  .read<DeleteAccountBloc>()
                  .add(const DeleteAccountSubmittedEvent());
            },
    );
  }
}
