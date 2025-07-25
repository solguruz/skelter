import 'package:flutter_skeleton/i18n/localization.dart';

enum DeleteAccountReasons {
  doNotNeedItAnyMore,
  productNoMoreRelevant,
  dislikeTheApp,
  other,
}

extension DeleteAccountReasonExtension on DeleteAccountReasons {
  String toViewString() {
    return '${name[0].toUpperCase()}${name.substring(1).toLowerCase()}';
  }

  String toDeleteAccountReasonString(AppLocalizations l10n) {
    switch (this) {
      case DeleteAccountReasons.doNotNeedItAnyMore:
        return l10n.delete_reason_do_not_need_anymore;
      case DeleteAccountReasons.productNoMoreRelevant:
        return l10n.delete_reason_product_no_more_relevant;
      case DeleteAccountReasons.dislikeTheApp:
        return l10n.delete_reason_dislike_app;
      case DeleteAccountReasons.other:
        return l10n.delete_reason_other;
    }
  }
}
