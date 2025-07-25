import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/delete_account/bloc/delete_account_bloc.dart';
import 'package:flutter_skeleton/presentation/delete_account/bloc/delete_account_event.dart';
import 'package:flutter_skeleton/presentation/delete_account/enum/delete_account_reasons.dart';
import 'package:flutter_skeleton/presentation/delete_account/widgets/delete_account_options_items.dart';
import 'package:flutter_skeleton/presentation/delete_account/widgets/other_reason_text_field.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class DeleteAccountReasonOptions extends StatelessWidget {
  const DeleteAccountReasonOptions({super.key});

  @override
  Widget build(BuildContext context) {
    const reasons = DeleteAccountReasons.values;

    final selectedReason =
        context.select<DeleteAccountBloc, DeleteAccountReasons?>(
      (bloc) => bloc.state.selectedReason,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localization.delete_reason_title,
          style: AppTextStyles.p1Medium.withColor(AppColors.textNeutralPrimary),
        ),
        const SizedBox(height: 24),
        ...reasons.map((reason) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: DeleteAccountOptionsItems(
              reason: reason.toDeleteAccountReasonString(context.localization),
              isSelected: selectedReason == reason,
              onSelected: () {
                context.read<DeleteAccountBloc>().add(
                      DeleteReasonSelectedEvent(reason: reason),
                    );
              },
            ),
          );
        }),
        const OtherReasonTextField(),
      ],
    );
  }
}
