import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:skelter/constants/constants.dart';
import 'package:skelter/i18n/app_localizations.dart';
import 'package:skelter/utils/app_environment.dart';

extension DateTimeExtensions on DateTime {
  String format({
    String pattern = kDefaultDateFormat,
  }) {
    try {
      return DateFormat(pattern).format(this);
    } catch (_) {
      return '';
    }
  }

  bool isFuture([DateTime? currentDateTime]) {
    return isAfter(currentDateTime ?? DateTime.now());
  }

  bool isPast([DateTime? currentDateTime]) {
    return isBefore(currentDateTime ?? DateTime.now());
  }

  bool isSameDay(DateTime other) =>
      year == other.year && month == other.month && day == other.day;

  bool isInRange(DateTime start, DateTime end) =>
      isAfter(start) && isBefore(end);

  String timeAgo(AppLocalizations localization) {
    try {
      final Duration difference = getCurrentDateTime().difference(this);

      if (difference.inDays >= 365) {
        final years = (difference.inDays / 365).floor();
        return years == 1
            ? localization.lastYear
            : localization.yearsAgo(years);
      } else if (difference.inDays >= 30) {
        final months = (difference.inDays / 30).floor();
        return months == 1
            ? localization.lastMonth
            : localization.monthsAgo(months);
      } else if (difference.inDays > 1) {
        return localization.daysAgo(difference.inDays);
      } else if (difference.inDays == 1) {
        return localization.yesterday;
      } else if (difference.inHours > 1) {
        return localization.hoursAgo(difference.inHours);
      } else if (difference.inHours == 1) {
        return localization.oneHourAgo;
      } else if (difference.inMinutes > 1) {
        return localization.minutesAgo(difference.inMinutes);
      } else if (difference.inMinutes == 1) {
        return localization.oneMinuteAgo;
      } else {
        return localization.justNow;
      }
    } catch (error) {
      debugPrint('Error parsing time ago: $error');
      return '';
    }
  }

  String to12HourFormat({String pattern = kDefaultTimeFormat12Hour}) {
    try {
      return DateFormat(pattern).format(toLocal());
    } catch (_) {
      return '';
    }
  }
}

DateTime getCurrentDateTime() {
  final bool isTest = AppEnvironment.isTestEnvironment;
  if (isTest) {
    return DateTime(2025, 4, 11, 8, 30, 20);
  }
  return DateTime.now();
}
