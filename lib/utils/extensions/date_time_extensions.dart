import 'package:intl/intl.dart';

extension UtcToLocal on DateTime {
  String convertUtcToLocal({
    required String format,
  }) {
    // Convert the DateTime object to the local time zone
    final DateTime localDateTime = toLocal();

    // Format the DateTime object to the desired format
    final DateFormat formatter = DateFormat(format);
    final String formattedDate = formatter.format(localDateTime);

    return formattedDate;
  }
}
