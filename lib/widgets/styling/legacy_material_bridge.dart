import 'package:flutter/material.dart' as legacy;
import 'package:material_ui/material_ui.dart';
import 'package:skelter/widgets/styling/app_theme_data.dart';

/// Gives widgets from packages that still use package:flutter/material.dart
/// the app theme and the Material localizations.
///
/// Use it in `MaterialApp.builder`. Remove it once every dependency has moved
/// to package:material_ui.
class LegacyMaterialBridge extends StatelessWidget {
  final Widget child;

  const LegacyMaterialBridge({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final themeEnum = Theme.of(context).brightness == Brightness.dark
        ? AppThemeEnum.DarkTheme
        : AppThemeEnum.LightTheme;

    return MaterialUiCompatibilityBridge(
      child: legacy.Theme(
        data: AppThemesData.legacyThemeData[themeEnum]!,
        child: child,
      ),
    );
  }
}
