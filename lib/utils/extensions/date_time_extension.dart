import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skelter/constants/constants.dart';
import 'package:skelter/i18n/localization.dart';

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

  String timeAgo(BuildContext context) {
    try {
      final Duration difference = DateTime.now().difference(this);

      if (difference.inDays >= 365) {
        final years = (difference.inDays / 365).floor();
        return years == 1
            ? context.localization.lastYear
            : context.localization.yearsAgo(years);
      } else if (difference.inDays >= 30) {
        final months = (difference.inDays / 30).floor();
        return months == 1
            ? context.localization.lastMonth
            : context.localization.monthsAgo(months);
      } else if (difference.inDays > 1) {
        return context.localization.daysAgo(difference.inDays);
      } else if (difference.inDays == 1) {
        return context.localization.yesterday;
      } else if (difference.inHours > 1) {
        return context.localization.hoursAgo(difference.inHours);
      } else if (difference.inHours == 1) {
        return context.localization.oneHourAgo;
      } else if (difference.inMinutes > 1) {
        return context.localization.minutesAgo(difference.inMinutes);
      } else if (difference.inMinutes == 1) {
        return context.localization.oneMinuteAgo;
      } else {
        return context.localization.justNow;
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
