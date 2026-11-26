import 'package:material_ui/material_ui.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class SettingsSectionDivider extends StatelessWidget {
  const SettingsSectionDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      color: context.currentTheme.strokeNeutralLight100,
      indent: 8.0,
      endIndent: 8.0,
    );
  }
}
