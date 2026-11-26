import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/reminder/bloc/reminder_bloc.dart';
import 'package:skelter/presentation/reminder/bloc/reminder_event.dart';
import 'package:skelter/presentation/reminder/constatnts/reminder_constants.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class ReminderDateTimeSelector extends StatelessWidget {
  const ReminderDateTimeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final dateTimeError = context.select<ReminderBloc, String?>(
      (bloc) => bloc.state.dateTimeError,
    );
    final selectedDateTime = context.select<ReminderBloc, DateTime>((bloc) {
      return bloc.state.selectedDateTime;
    });

    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          context.localization.date_and_time,
          style: AppTextStyles.p3Medium.copyWith(
            color: context.currentTheme.textNeutralPrimary,
          ),
        ),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: () => _selectDateTime(context, selectedDateTime),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: (dateTimeError != null && dateTimeError.isNotEmpty)
                    ? context.currentTheme.strokeErrorDefault
                    : context.currentTheme.strokeNeutralLight200,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    DateFormat(
                      kReminderDateTimeFormat,
                    ).format(selectedDateTime),
                    style: AppTextStyles.p3Medium.copyWith(
                      color: context.currentTheme.textNeutralSecondary,
                    ),
                  ),
                ),
                Icon(
                  TablerIcons.calendar_clock,
                  color: context.currentTheme.iconNeutralDefault,
                ),
              ],
            ),
          ),
        ),
        if (dateTimeError != null && dateTimeError.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 6),
            child: Text(
              dateTimeError,
              style: AppTextStyles.p4Regular.copyWith(
                color: context.currentTheme.strokeErrorDefault,
              ),
            ),
          ),
      ],
    );
  }

  Future<void> _selectDateTime(
    BuildContext context,
    DateTime currentDateTime,
  ) async {
    final date = await showDatePicker(
      context: context,
      initialDate: currentDateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (date != null && context.mounted) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(currentDateTime),
      );

      if (time != null && context.mounted) {
        final selectedDateTime = DateTime(
          date.year,
          date.month,
          date.day,
          time.hour,
          time.minute,
        );

        context.read<ReminderBloc>().add(
          DateTimeSelectedEvent(dateTime: selectedDateTime),
        );
      }
    }
  }
}
