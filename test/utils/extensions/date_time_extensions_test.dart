import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skelter/i18n/app_localizations.dart';
import 'package:skelter/utils/extensions/date_time_extensions.dart';

class MockAppLocalizations extends Mock implements AppLocalizations {}

void main() {
  group('DateTimeExtensions Tests', () {
    final testCurrentDate = DateTime(2025, 9, 22, 12);

    test('isFuture returns true for a date after now', () {
      final now = DateTime(2025, 9, 20);
      final futureDate = now.add(const Duration(days: 5));

      expect(futureDate.isFuture(now), true);
    });

    test('isPast returns true for a date before now', () {
      final now = DateTime(2025, 9, 20);
      final pastDate = now.subtract(const Duration(days: 5));

      expect(pastDate.isPast(now), true);
    });

    test(
      'format returns correctly formatted date string',
      () {
        expect(testCurrentDate.format(pattern: 'yyyy-MM-dd'), '2025-09-22');
        expect(testCurrentDate.format(pattern: 'MM/dd/yyyy'), '09/22/2025');
      },
    );

    test(
      'isSameDay returns true when two dates fall on the same day',
      () {
        final sameDayDate = DateTime(2025, 9, 22, 23, 59);
        expect(testCurrentDate.isSameDay(sameDayDate), true);
      },
    );

    test(
      'isSameDay returns false for different days',
      () {
        final differentDayDate = DateTime(2025, 9, 23);
        expect(testCurrentDate.isSameDay(differentDayDate), false);
      },
    );

    test(
      'isInRange returns true when date is within a start-end range',
      () {
        final rangeStart = testCurrentDate.subtract(const Duration(days: 1));
        final rangeEnd = testCurrentDate.add(const Duration(days: 1));
        expect(testCurrentDate.isInRange(rangeStart, rangeEnd), true);
      },
    );

    test(
      'isInRange returns false when date is outside the range',
      () {
        final rangeStart = testCurrentDate.add(const Duration(days: 1));
        final rangeEnd = testCurrentDate.add(const Duration(days: 2));
        expect(testCurrentDate.isInRange(rangeStart, rangeEnd), false);
      },
    );

    test(
      'to12HourFormat formats time correctly in 12-hour format',
      () {
        final testTimeMorning = DateTime(2025, 9, 22, 9, 15);
        final testTimeEvening = DateTime(2025, 9, 22, 21, 45);

        expect(testTimeMorning.to12HourFormat(), '09:15 AM');
        expect(testTimeEvening.to12HourFormat(), '09:45 PM');
      },
    );

    testWidgets(
      'timeAgo returns correct localized strings for different ranges',
      (tester) async {
        final mockLocalizations = MockAppLocalizations();

        when(() => mockLocalizations.justNow).thenReturn('Just now');
        when(() => mockLocalizations.oneMinuteAgo).thenReturn('1 min ago');
        when(() => mockLocalizations.oneHourAgo).thenReturn('1 hr ago');
        when(() => mockLocalizations.yesterday).thenReturn('Yesterday');
        when(() => mockLocalizations.lastMonth).thenReturn('Last month');
        when(() => mockLocalizations.lastYear).thenReturn('Last year');

        when(() => mockLocalizations.minutesAgo(any())).thenAnswer(
          (mockCall) => '${mockCall.positionalArguments.first} min ago',
        );
        when(() => mockLocalizations.hoursAgo(any())).thenAnswer(
          (mockCall) => '${mockCall.positionalArguments.first} hrs ago',
        );
        when(() => mockLocalizations.daysAgo(any())).thenAnswer(
          (mockCall) => '${mockCall.positionalArguments.first} days ago',
        );
        when(() => mockLocalizations.monthsAgo(any())).thenAnswer(
          (mockCall) => '${mockCall.positionalArguments.first} months ago',
        );
        when(() => mockLocalizations.yearsAgo(any())).thenAnswer(
          (mockCall) => '${mockCall.positionalArguments.first} years ago',
        );

        await tester.pumpWidget(
          MaterialApp(
            locale: const Locale('en'),
            localizationsDelegates: [
              _MockLocalizationsDelegate(mockLocalizations),
            ],
            home: Builder(
              builder: (context) {
                final testCurrentTime = testCurrentDate;

                final testCases = [
                  (testCurrentTime, 'Just now'),
                  (
                    testCurrentTime.subtract(const Duration(minutes: 1)),
                    '1 min ago'
                  ),
                  (
                    testCurrentTime.subtract(const Duration(minutes: 5)),
                    '5 min ago'
                  ),
                  (
                    testCurrentTime.subtract(const Duration(hours: 1)),
                    '1 hr ago'
                  ),
                  (
                    testCurrentTime.subtract(const Duration(hours: 5)),
                    '5 hrs ago'
                  ),
                  (
                    testCurrentTime.subtract(const Duration(days: 1)),
                    'Yesterday'
                  ),
                  (
                    testCurrentTime.subtract(const Duration(days: 3)),
                    '3 days ago'
                  ),
                  (
                    testCurrentTime.subtract(const Duration(days: 30)),
                    'Last month'
                  ),
                  (
                    testCurrentTime.subtract(const Duration(days: 60)),
                    '2 months ago'
                  ),
                  (
                    testCurrentTime.subtract(const Duration(days: 365)),
                    'Last year'
                  ),
                  (
                    testCurrentTime.subtract(const Duration(days: 730)),
                    '2 years ago'
                  ),
                ];

                for (final (dateTime, expectedString) in testCases) {
                  final result = dateTime.timeAgo(mockLocalizations);
                  expect(
                    result,
                    expectedString,
                    reason: 'Failed for $dateTime',
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        );
      },
    );
  });
}

class _MockLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  final AppLocalizations mockLocalizations;

  const _MockLocalizationsDelegate(this.mockLocalizations);

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<AppLocalizations> load(Locale locale) async => mockLocalizations;

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}
