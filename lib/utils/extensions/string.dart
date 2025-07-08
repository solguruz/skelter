import 'package:flutter_skeleton/utils/extensions/int.dart';

const List<String> kNumbersString = <String>[
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '0',
];
const String kDiacriticsString =
    'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
const String kNonDiacriticsString =
    'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';

extension StringNullCheck on String? {
  bool isNullOrEmpty() {
    if (this == null) {
      return true;
    }
    if (this!.isEmpty) {
      return true;
    }
    return false;
  }
}

extension StringHelperExtension on String {
  String removeDiacriticalMarks() => splitMapJoin(
        '',
        onNonMatch: (String char) =>
            char.isNotEmpty && kDiacriticsString.contains(char)
                ? kNonDiacriticsString[kDiacriticsString.indexOf(char)]
                : char,
      );

  String toNormalize() => toLowerCase().removeDiacriticalMarks();

  String removeLastWord([int amount = 1]) {
    final int cacheLenght = length;
    if (cacheLenght > amount) {
      return substring(0, cacheLenght - amount);
    } else {
      return '';
    }
  }

  String toCapitalize() => isNotEmpty
      ? '${this[0].toUpperCase()}${substring(1, length).toLowerCase()}'
      : this;

  String toPluralize() {
    if (isEmpty) return '';
    if (this[length - 1].toLowerCase() == 's') return this;
    return '${this}s';
  }

  String removeAllNotNumber({List<String> exclude = const <String>[]}) {
    final List<String> valid = kNumbersString.toList()..addAll(exclude);
    final StringBuffer buffer = StringBuffer();
    for (int i = 0; i < length; i++) {
      final String character = this[i];
      if (valid.contains(character)) buffer.write(character);
    }
    return buffer.toString();
  }

  String censorEmail({int begin = 4, int end = 4, int asterisks = 4}) {
    final int count = length;
    final StringBuffer censor = StringBuffer();
    asterisks.forEach((_) => censor.write('*'));

    if (count >= begin + end) {
      return '${substring(0, begin)}${censor.toString()}'
          '${substring(count - end, count)}';
    }
    return this;
  }

  String removeAllNumbers({List<String> include = const <String>[]}) {
    final List<String> invalid = kNumbersString.toList()..addAll(include);
    final StringBuffer buffer = StringBuffer();
    for (int i = 0; i < length; i++) {
      final String character = this[i];
      if (!invalid.contains(character)) buffer.write(character);
    }
    return buffer.toString();
  }
}

extension NullableStringHelperExtension on String? {
  /// ```dart
  /// // DO THIS:
  /// return this != null && this!.isNotEmpty;
  /// ```
  bool haveContent() => this != null && this!.isNotEmpty;
}

extension RegexHelperExtension on String {
  bool hasLetterAndNumber() =>
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)').hasMatch(this);

  bool hasSpecialCharacter() =>
      RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(this);
}
