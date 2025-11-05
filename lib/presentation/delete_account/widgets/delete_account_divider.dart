import 'package:flutter/material.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

class DeleteAccountDivider extends StatelessWidget {
  const DeleteAccountDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: 8,
      endIndent: 8,
      color: context.currentTheme.strokeNeutralLight200,
    );
  }
}
