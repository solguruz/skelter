import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class WarningNotes extends StatelessWidget {
  final String text;

  const WarningNotes({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: .start,
        children: [
          Icon(
            TablerIcons.xbox_x,
            color: context.currentTheme.bgErrorDefault,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.p2Medium.copyWith(
                color: context.currentTheme.textNeutralPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
