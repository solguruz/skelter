import 'package:flutter/material.dart';
import 'package:flutter_skeleton/core/app_sizes.dart';

class SettingsSectionDivider extends StatelessWidget {
  const SettingsSectionDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      indent: AppSize.S,
      endIndent: AppSize.S,
    );
  }
}
