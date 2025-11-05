import 'package:flutter/material.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

class ProfileItemsDivider extends StatelessWidget {
  const ProfileItemsDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: 8.0,
      endIndent: 8.0,
      color: context.currentTheme.strokeNeutralLight100,
      height: 1,
    );
  }
}
