import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/delete_account/widgets/warning_notes.dart';

class DeleteAccountWarnings extends StatelessWidget {
  const DeleteAccountWarnings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localization.delete_warning_title,
          style: AppTextStyles.p1Medium,
        ),
        const SizedBox(height: 24),
        WarningNotes(text: context.localization.delete_warning_products_chats),
        const SizedBox(height: 24),
        WarningNotes(text: context.localization.delete_warning_account_info),
      ],
    );
  }
}
