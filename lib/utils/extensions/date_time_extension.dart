import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  DateTime get current {
    final bool isTest = Platform.environment.containsKey('FLUTTER_TEST');
    return isTest ? DateTime(2025, 4, 11, 8, 30, 20) : DateTime.now();
  }

  String format({String pattern = 'dd-MM-yyyy'}) {
    try {
      return DateFormat(pattern).format(this);
    } catch (_) {
      return '';
    }
  }

  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isInRange(DateTime start, DateTime end) {
    return isAfter(start) && isBefore(end);
  }

  String get timeAgo {
    try {
      final Duration difference = current.difference(this);

      if (difference.inDays >= 365) {
        final years = (difference.inDays / 365).floor();
        return years == 1 ? 'Last year' : '$years years ago';
      } else if (difference.inDays >= 30) {
        final months = (difference.inDays / 30).floor();
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
      return '';
    }
  }

  String get to12HourFormat {
    try {
      return DateFormat('hh:mm a').format(toLocal());
    } catch (_) {
      return '';
    }
  }
}
