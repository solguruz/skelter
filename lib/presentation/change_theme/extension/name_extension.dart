extension NameExtension on String {
  String get capitalizeFirst => this[0].toUpperCase() + this.substring(1);
}
