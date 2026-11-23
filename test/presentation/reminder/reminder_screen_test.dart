import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skelter/presentation/reminder/bloc/reminder_bloc.dart';
import 'package:skelter/presentation/reminder/bloc/reminder_event.dart';
import 'package:skelter/presentation/reminder/bloc/reminder_state.dart';
import 'package:skelter/presentation/reminder/reminder_screen.dart';
import 'package:skelter/presentation/reminder/widgets/reminder_appbar.dart';
import 'package:skelter/presentation/reminder/widgets/schedule_reminder_button.dart';
import 'package:skelter/widgets/styling/app_theme_data.dart';

import '../../flutter_test_config.dart';
import '../../test_helpers.dart';

class MockReminderBloc extends MockBloc<ReminderEvent, ReminderState>
    implements ReminderBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockReminderBloc reminderBloc;

  setUp(() {
    reminderBloc = MockReminderBloc();
  });

  testExecutable(() {
    goldenTest(
      'Reminder AppBar',
      fileName: 'reminder_appbar',
      builder: () => GoldenTestGroup(
        columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
        children: [
          createTestScenario(
            name: 'Light Theme',
            addScaffold: true,
            child: const Column(children: [ReminderAppbar()]),
          ),
          createTestScenario(
            name: 'Dark Theme',
            theme: AppThemeEnum.DarkTheme,
            addScaffold: true,
            child: const Column(children: [ReminderAppbar()]),
          ),
        ],
      ),
    );
  });

  testExecutable(() {
    goldenTest(
      'Schedule Reminder Button',
      fileName: 'schedule_reminder_button',
      builder: () {
        when(() => reminderBloc.state).thenReturn(ReminderState.test());
        return GoldenTestGroup(
          columnWidthBuilder: (_) => const FixedColumnWidth(pixel5DeviceWidth),
          children: [
            createTestScenario(
              name: 'Light Theme',
              addScaffold: true,
              providers: [
                BlocProvider<ReminderBloc>.value(value: reminderBloc),
              ],
              child: const ScheduleReminderButton(),
            ),
            createTestScenario(
              name: 'Dark Theme',
              theme: AppThemeEnum.DarkTheme,
              addScaffold: true,
              providers: [
                BlocProvider<ReminderBloc>.value(value: reminderBloc),
              ],
              child: const ScheduleReminderButton(),
            ),
          ],
        );
      },
    );
  });

  group('ReminderScreen', () {
    testExecutable(() {
      goldenTest(
        'Reminder Screen Body - Default',
        fileName: 'reminder_screen_body',
        builder: () {
          when(() => reminderBloc.state).thenReturn(ReminderState.test());
          return GoldenTestGroup(
            columnWidthBuilder: (_) =>
                const FixedColumnWidth(pixel5DeviceWidth),
            children: [
              createTestScenario(
                name: 'Light Theme',
                addScaffold: true,
                providers: [
                  BlocProvider<ReminderBloc>.value(value: reminderBloc),
                ],
                child: const ReminderScreenBody(),
              ),
              createTestScenario(
                name: 'Dark Theme',
                theme: AppThemeEnum.DarkTheme,
                addScaffold: true,
                providers: [
                  BlocProvider<ReminderBloc>.value(value: reminderBloc),
                ],
                child: const ReminderScreenBody(),
              ),
            ],
          );
        },
      );
    });

    testExecutable(() {
      goldenTest(
        'Reminder Screen Body - Filled',
        fileName: 'reminder_screen_body_filled',
        builder: () {
          when(() => reminderBloc.state).thenReturn(
            ReminderState.test(
              title: 'Team Meeting',
              description: 'Weekly sync with the team',
              selectedDateTime: DateTime(2025, 6, 15, 10, 30),
            ),
          );
          return GoldenTestGroup(
            columnWidthBuilder: (_) =>
                const FixedColumnWidth(pixel5DeviceWidth),
            children: [
              createTestScenario(
                name: 'Light Theme',
                addScaffold: true,
                providers: [
                  BlocProvider<ReminderBloc>.value(value: reminderBloc),
                ],
                child: const ReminderScreenBody(),
              ),
              createTestScenario(
                name: 'Dark Theme',
                theme: AppThemeEnum.DarkTheme,
                addScaffold: true,
                providers: [
                  BlocProvider<ReminderBloc>.value(value: reminderBloc),
                ],
                child: const ReminderScreenBody(),
              ),
            ],
          );
        },
      );
    });

    testExecutable(() {
      goldenTest(
        'Reminder Screen Body - Error',
        fileName: 'reminder_screen_body_error',
        builder: () {
          when(() => reminderBloc.state).thenReturn(
            ReminderState.test(
              title: '',
              titleError: 'Title is required',
              dateTimeError: 'Please select a future date and time',
            ),
          );
          return GoldenTestGroup(
            columnWidthBuilder: (_) =>
                const FixedColumnWidth(pixel5DeviceWidth),
            children: [
              createTestScenario(
                name: 'Light Theme',
                addScaffold: true,
                providers: [
                  BlocProvider<ReminderBloc>.value(value: reminderBloc),
                ],
                child: const ReminderScreenBody(),
              ),
              createTestScenario(
                name: 'Dark Theme',
                theme: AppThemeEnum.DarkTheme,
                addScaffold: true,
                providers: [
                  BlocProvider<ReminderBloc>.value(value: reminderBloc),
                ],
                child: const ReminderScreenBody(),
              ),
            ],
          );
        },
      );
    });
  });
}
