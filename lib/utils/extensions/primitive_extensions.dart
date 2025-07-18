extension StringNullCheck on String? {
  /// Returns `true` if the string is null or empty.
  bool isNullOrEmpty() => this?.isEmpty ?? true;

  /// Returns `true` if the string is non-null and not empty.
  bool haveContent() => this?.isNotEmpty ?? false;

  bool isNumeric() => this != null && num.tryParse(this!) != null;

  String capitalize() => this == null || this!.isEmpty
      ? ''
      : '${this![0].toUpperCase()}${this!.substring(1)}';
}

extension RegexHelperExtension on String {
  bool hasLetterAndNumber() =>
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)').hasMatch(this);

  bool hasSpecialCharacter() =>
      RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(this);

  String get reversed => split('').reversed.join();
}

/// Extension to round a double to a fixed number of decimal places.
extension Precision on double {
  double toPrecision(int fractionDigits) =>
      double.parse(toStringAsFixed(fractionDigits));

  /// Checks if the value lies within a specific range (inclusive).
  bool isWithinRange(double min, double max) => this > min && this <= max;
}

extension IntRange on int {
  bool withRange(int min, int max) => this >= min && this <= max;
}

// List Extensions
extension ListExtensions<T> on List<T> {
  List<T> distinct() {
    final seen = <T>{};
    return where((e) => seen.add(e)).toList();
  }
}
