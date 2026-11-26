import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

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
            shape: .circle,
          ),
          padding: const EdgeInsets.all(2),
          child: Icon(
            TablerIcons.x,
            size: 16,
            color: context.currentTheme.strokeShadesWhite,
          ),
        ),
      ),
    );
  }
}
