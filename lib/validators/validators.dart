import 'package:flutter/material.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

bool isValidUrl({required String url}) {
  final RegExp pattern = RegExp(
    r'\b((http(s)?://www\.|http(s)?://|www\.)[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)+(:\d+)?(\/\S*)?)\b',
    caseSensitive: false,
  );
  final Iterable<RegExpMatch> matches = pattern.allMatches(url);
  if (matches.isEmpty) {
    return false;
  }
  for (final RegExpMatch match in matches) {
    String url = match.group(0)!;
    if (!url.startsWith(RegExp(r'http'))) {
      url = 'http://$url';
    }
    final Uri? uri = Uri.tryParse(url);
    if (uri != null && uri.host.isNotEmpty) {
      return true;
    }
  }
  return false;
}

String? isEmailValid(String email, BuildContext context) {
  if (email.isEmpty) {
    return context.localization.login_signup_email_cant_be_empty;
  } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
      .hasMatch(email)) {
    return context.localization.login_signup_invalid_email;
  }
  return null;
}

Future<bool> isPhoneNumberValid(String phoneNumberWithCode) async {
  final phoneNumber = PhoneNumber.parse(phoneNumberWithCode);

  return phoneNumber.isValid(type: PhoneNumberType.mobile);
}
