import 'package:flutter/material.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

class DeleteAccountDivider extends StatelessWidget {
  const DeleteAccountDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      indent: 8,
      endIndent: 8,
      color: AppColors.neutral100,
    );
  }
}
