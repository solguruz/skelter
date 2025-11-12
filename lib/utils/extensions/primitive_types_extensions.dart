// String Extensions
extension RegexHelperExtension on String {
  bool hasLetterAndNumber() =>
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)').hasMatch(this);

  bool hasSpecialCharacter() =>
      RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(this);

  String get reversed => split('').reversed.join();
}

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

  String get capitalizeFirst {
    if (this == null || this!.isEmpty) return '';
    return this![0].toUpperCase() + this!.substring(1);
  }

  bool haveContent() => this != null && this!.isNotEmpty;
}

// Numeric Type Extensions
extension Precision on double {
  double toPrecision(int fractionDigits) =>
      double.parse(toStringAsFixed(fractionDigits));

  bool isWithinRange(double min, double max) => this > min && this <= max;
}

extension IntRange on int {
  bool withRange(int min, int max) => this >= min && this <= max;
}

// Collection Extensions
extension DistinctList<T> on List<T> {
  List<T> distinct() => toSet().toList();
}
