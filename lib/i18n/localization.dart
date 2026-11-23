import 'package:material_ui/material_ui.dart';
import 'package:skelter/i18n/app_localizations.dart';

extension LocalizationContext on BuildContext {
  AppLocalizations get localization => AppLocalizations.of(this)!;
}
