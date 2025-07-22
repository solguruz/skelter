import 'package:flutter_skeleton/i18n/localization.dart';

enum DeleteAccountReasons {
  unused,
  irrelevant,
  dislike,
  other,
}

extension DeleteAccountReasonExtension on DeleteAccountReasons {
  String toViewString() {
    return '${name[0].toUpperCase()}${name.substring(1).toLowerCase()}';
  }

  String toDeleteAccountReasonString(AppLocalizations l10n) {
    switch (this) {
      case DeleteAccountReasons.unused:
        return l10n.delete_reason_unused;
      case DeleteAccountReasons.irrelevant:
        return l10n.delete_reason_irrelevant;
      case DeleteAccountReasons.dislike:
        return l10n.delete_reason_dislike;
      case DeleteAccountReasons.other:
        return l10n.delete_reason_other;
    }
  }
}
