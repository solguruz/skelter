import 'package:flutter/cupertino.dart';
import 'package:flutter_skeleton/utils/app_environment.dart';
import 'package:intl/intl.dart';

extension TimeAgo on DateTime {
  String get timeAgo {
    try {
      final Duration difference = getCurrentDateTime().difference(this);

      if (difference.inDays >= 365) {
        final int years = (difference.inDays / 365).floor();
        return years == 1 ? 'Last year' : '$years years ago';
      } else if (difference.inDays >= 30) {
        final int months = (difference.inDays / 30).floor();
        return months == 1 ? 'Last month' : '$months months ago';
      } else if (difference.inDays > 1) {
        return '${difference.inDays} days ago';
      } else if (difference.inDays == 1) {
        return 'Yesterday';
      } else if (difference.inHours > 1) {
        return '${difference.inHours} hrs ago';
      } else if (difference.inHours == 1) {
        return '1 hr ago';
      } else if (difference.inMinutes > 1) {
        return '${difference.inMinutes} min ago';
      } else if (difference.inMinutes == 1) {
        return '1 min ago';
      } else {
        return 'Just now';
      }
    } catch (error) {
      debugPrint('Error parsing time ago: $error');
    }
    return '';
  }

  String get to12HourFormat {
    return DateFormat('hh:mm a').format(toLocal());
  }
}

DateTime getCurrentDateTime() {
  final bool isTest = AppEnvironment.isTestEnvironment;
  if (isTest) {
    return DateTime(2025, 4, 11, 8, 30, 20);
  }
  return DateTime.now();
}
