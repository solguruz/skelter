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

extension NullableStringHelperExtension on String? {
  bool haveContent() => this != null && this!.isNotEmpty;
}

extension RegexHelperExtension on String {
  bool hasLetterAndNumber() =>
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)').hasMatch(this);

  bool hasSpecialCharacter() =>
      RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(this);
}
