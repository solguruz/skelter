import 'package:flutter/material.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/delete_account/widgets/warning_notes.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

class DeleteAccountWarnings extends StatelessWidget {
  const DeleteAccountWarnings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          context.localization.delete_warning_title,
          style: AppTextStyles.p1Medium.copyWith(
            color: context.currentTheme.textNeutralPrimary,
          ),
        ),
        const SizedBox(height: 24),
        WarningNotes(text: context.localization.delete_warning_products_chats),
        const SizedBox(height: 24),
        WarningNotes(text: context.localization.delete_warning_account_info),
      ],
    );
  }
}
