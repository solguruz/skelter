import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/reminder/bloc/reminder_bloc.dart';
import 'package:skelter/presentation/reminder/bloc/reminder_event.dart';
import 'package:skelter/utils/extensions/build_context_ext.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';

class ScheduleReminderButton extends StatelessWidget {
  const ScheduleReminderButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select<ReminderBloc, bool>(
      (bloc) => bloc.state.isLoading,
    );

    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16 + context.bottomPadding,
      ),
      child: AppButton(
        foregroundColor: context.currentTheme.textNeutralLight,
        size: AppButtonSize.extraLarge,
        onPressed: () {
          if (isLoading) return;
          context.read<ReminderBloc>().add(ScheduleReminderEvent());
        },
        label: context.localization.schedule_reminder,
        isLoading: isLoading,
      ),
    );
  }
}
