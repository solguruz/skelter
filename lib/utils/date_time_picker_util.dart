import 'package:flutter/material.dart';

class DateTimePickerUtil {
  DateTimePickerUtil._();

  static DateTime get _now => DateTime.now();

  /// Returns the earliest selectable date, defaults to 5 years ago.
  static DateTime _defaultFirstDate(DateTime? date) =>
      date ?? DateTime(_now.year - 5, _now.month, _now.day);

  /// Returns the latest selectable date, defaults to 5 years ahead.
  static DateTime _defaultLastDate(DateTime? date) =>
      date ?? DateTime(_now.year + 5, _now.month, _now.day);

  /// Shows a calendar range picker with a customizable date range.
  ///
  /// [initialRange] - Optional default selected range.
  /// [firstDate] - Minimum selectable date.
  /// [lastDate] - Maximum selectable date.
  /// [helpText] - Optional picker title.
  /// [onRangeSelected] - Callback with selected date range.
  static Future<void> showRangeDatePicker({
    required BuildContext context,
    DateTimeRange? initialRange,
    DateTime? firstDate,
    DateTime? lastDate,
    String? helpText,
    required ValueChanged<DateTimeRange> onRangeSelected,
  }) async {
    final first = _defaultFirstDate(firstDate);
    final last = _defaultLastDate(lastDate);

    if (first.isAfter(last)) {
      throw ArgumentError('firstDate must be before or equal to lastDate');
    }

    final pickedRange = await showDateRangePicker(
      context: context,
      firstDate: first,
      lastDate: last,
      initialDateRange: initialRange,
      helpText: helpText,
    );

    if (pickedRange != null) {
      onRangeSelected(pickedRange);
    }
  }

  /// Shows a calendar **single date picker** with a customizable date range.
  ///
  /// [initialDate] - Initially focused date.
  /// [firstDate] - Minimum selectable date.
  /// [lastDate] - Maximum selectable date.
  /// [helpText] - Optional picker title.
  /// [onDateSelected] - Callback with selected date.
  static Future<void> showSingleDatePicker({
    required BuildContext context,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    String? helpText,
    required ValueChanged<DateTime> onDateSelected,
  }) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? _now,
      firstDate: _defaultFirstDate(firstDate),
      lastDate: _defaultLastDate(lastDate),
      helpText: helpText,
    );

    if (pickedDate != null) {
      onDateSelected(pickedDate);
    }
  }

  /// Shows a **date and time picker**, and returns a combined `DateTime`.
  ///
  /// [initialDateTime] - Initial date and time to prefill.
  /// [firstDate] - Minimum date allowed.
  /// [lastDate] - Maximum date allowed.
  /// [onDateTimeSelected] - Callback with final selected `DateTime`.
  static Future<void> showDateTimePicker({
    required BuildContext context,
    DateTime? initialDateTime,
    DateTime? firstDate,
    DateTime? lastDate,
    required ValueChanged<DateTime> onDateTimeSelected,
  }) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDateTime ?? _now,
      firstDate: _defaultFirstDate(firstDate),
      lastDate: _defaultLastDate(lastDate),
    );

    if (pickedDate == null) return;

    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initialDateTime ?? _now),
    );

    if (pickedTime == null) return;

    final selectedDateTime = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    onDateTimeSelected(selectedDateTime);
  }
}
