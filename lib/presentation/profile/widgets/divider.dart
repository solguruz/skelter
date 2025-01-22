import 'package:flutter/material.dart';
import 'package:flutter_skeleton/core/app_sizes.dart';

class ProfileItemsDivider extends StatelessWidget {
  const ProfileItemsDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      indent: AppSize.S,
      endIndent: AppSize.S,
    );
  }
}
