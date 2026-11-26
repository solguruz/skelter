import 'package:auto_route/annotations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/reminder/bloc/reminder_bloc.dart';
import 'package:skelter/presentation/reminder/bloc/reminder_event.dart';
import 'package:skelter/presentation/reminder/bloc/reminder_state.dart';
import 'package:skelter/presentation/reminder/widgets/reminder_appbar.dart';
import 'package:skelter/presentation/reminder/widgets/reminder_date_time_selector.dart';
import 'package:skelter/presentation/reminder/widgets/reminder_input_fields.dart';
import 'package:skelter/presentation/reminder/widgets/schedule_reminder_button.dart';
import 'package:skelter/utils/extensions/build_context_ext.dart';

@RoutePage()
class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.localization;
    return BlocProvider(
      create: (_) => ReminderBloc(localizations: appLocalizations),
      child: BlocListener<ReminderBloc, ReminderState>(
        listener: (context, state) {
          if (state is ReminderScheduledState) {
            context.showSnackBar(
              appLocalizations.reminder_scheduled_successfully,
            );
            context.read<ReminderBloc>().add(ClearReminderEvent());
          } else if (state is ReminderSchedulingFailedState) {
            context.showSnackBar(appLocalizations.reminder_schedule_failed);
          }
        },
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: const Scaffold(
            appBar: ReminderAppbar(),
            body: SingleChildScrollView(child: ReminderScreenBody()),
            bottomNavigationBar: ScheduleReminderButton(),
          ),
        ),
      ),
    );
  }
}

class ReminderScreenBody extends StatelessWidget {
  const ReminderScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(height: 20),
          ReminderInputFields(),
          SizedBox(height: 20),
          ReminderDateTimeSelector(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
