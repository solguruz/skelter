import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/reminder/bloc/reminder_bloc.dart';
import 'package:skelter/presentation/reminder/bloc/reminder_event.dart';
import 'package:skelter/presentation/reminder/bloc/reminder_state.dart';
import 'package:skelter/utils/extensions/primitive_types_extensions.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class ReminderInputFields extends StatefulWidget {
  const ReminderInputFields({super.key});

  @override
  State<ReminderInputFields> createState() => _ReminderInputFieldsState();
}

class _ReminderInputFieldsState extends State<ReminderInputFields> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = context.read<ReminderBloc>().state.title;
    _descriptionController.text = context
        .read<ReminderBloc>()
        .state
        .description;

    _titleController.addListener(() {
      final String? previousError = context
          .read<ReminderBloc>()
          .state
          .titleError;
      if (previousError != null && previousError.isNotEmpty) {
        context.read<ReminderBloc>().add(TitleErrorEvent(error: ''));
      }
      context.read<ReminderBloc>().add(
        TitleChangedEvent(title: _titleController.text.trim()),
      );
    });

    _descriptionController.addListener(() {
      context.read<ReminderBloc>().add(
        DescriptionChangedEvent(
          description: _descriptionController.text.trim(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final String? titleError = context.select<ReminderBloc, String?>(
      (bloc) => bloc.state.titleError,
    );

    return BlocListener<ReminderBloc, ReminderState>(
      listener: (context, state) {
        if (state is ReminderFormClearedState) {
          _titleController.clear();
          _descriptionController.clear();
        }
      },
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            context.localization.reminder_title,
            style: AppTextStyles.p3Medium.copyWith(
              color: context.currentTheme.textNeutralPrimary,
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: _titleController,
            style: AppTextStyles.p3Medium.copyWith(
              color: context.currentTheme.textNeutralPrimary,
            ),
            decoration: InputDecoration(
              hintText: context.localization.reminder_title_hint,
              hintStyle: AppTextStyles.p2Medium.copyWith(
                color: context.currentTheme.textNeutralDisable,
              ),
              errorText: titleError.isNullOrEmpty() ? null : titleError,
              filled: true,
              fillColor: context.currentTheme.bgSurfaceBase2,
              border: _buildOutlineInputBorder(hasFocus: false),
              enabledBorder: _buildOutlineInputBorder(hasFocus: false),
              focusedBorder: _buildOutlineInputBorder(hasFocus: true),
              errorBorder: _buildOutlineInputBorder(isErrorBorder: true),
            ),
            textInputAction: .next,
          ),
          const SizedBox(height: 20),
          Text(
            context.localization.reminder_description,
            style: AppTextStyles.p3Medium.copyWith(
              color: context.currentTheme.textNeutralPrimary,
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: _descriptionController,
            style: AppTextStyles.p3Medium.copyWith(
              color: context.currentTheme.textNeutralPrimary,
            ),
            decoration: InputDecoration(
              hintText: context.localization.reminder_description_hint,
              hintStyle: AppTextStyles.p2Medium.copyWith(
                color: context.currentTheme.textNeutralDisable,
              ),
              filled: true,
              fillColor: context.currentTheme.bgSurfaceBase2,
              border: _buildOutlineInputBorder(hasFocus: false),
              enabledBorder: _buildOutlineInputBorder(hasFocus: false),
              focusedBorder: _buildOutlineInputBorder(hasFocus: true),
            ),
            maxLines: 2,
            textInputAction: .done,
          ),
        ],
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder({
    bool? hasFocus,
    bool? isErrorBorder,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: isErrorBorder ?? false
            ? context.currentTheme.strokeErrorDefault
            : hasFocus ?? false
            ? context.currentTheme.strokeBrandHover
            : context.currentTheme.strokeNeutralLight200,
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
