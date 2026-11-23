import 'package:flutter/material.dart' as legacy;
import 'package:material_ui/material_ui.dart';
import 'package:skelter/widgets/styling/app_theme_data.dart';

/// Gives widgets from packages that still use the legacy
/// `package:flutter/material.dart` the app theme and Material localizations.
class LegacyMaterialScope extends StatelessWidget {
  const LegacyMaterialScope({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialUiCompatibilityBridge(
      child: legacy.Theme(
        data: AppThemesData.legacyThemeData(Theme.of(context).brightness),
        child: child,
      ),
    );
  }
}
