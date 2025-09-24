extension NameExtension on String {
  String get capitalizeFirst =>
      isNotEmpty ? this[0].toUpperCase() + substring(1) : this;
}
