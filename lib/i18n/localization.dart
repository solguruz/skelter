import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Exporting the 'AppLocalizations' type so that we can only reference this file
// to access the localization API.
export 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Extension method on [BuildContext] which reduces the boilerplate code needed
/// to localize the text in the app. Rather than writing...
///
/// ```dart
/// final text = AppLocalizations.of(context).appTitle;
/// ```
///
/// ... you should use this shorter syntax:
///
/// ```dart
/// final text = context.l10n.appTitle;
/// ```
extension LocalizationContext on BuildContext {
  /// Returns the [AppLocalizations] instance with localized strings.
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
