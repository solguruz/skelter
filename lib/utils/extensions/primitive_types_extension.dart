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
extension DistinctList<T> on List<T> {
  List<T> distinct() => toSet().toList();
}
