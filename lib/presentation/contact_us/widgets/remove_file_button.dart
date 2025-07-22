import 'package:flutter/material.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class RemoveFileButton extends StatelessWidget {
  const RemoveFileButton({
    required this.index,
    required this.onRemove,
    super.key,
  });

  final void Function(int index) onRemove;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 3,
      right: 3,
      child: GestureDetector(
        onTap: () => onRemove(index),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.neutral800,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(2),
          child: const Icon(
            TablerIcons.x,
            size: 16,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
