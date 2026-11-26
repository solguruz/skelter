import 'package:clarity_flutter/clarity_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/feedback/bloc/feedback_bloc.dart';
import 'package:skelter/presentation/feedback/bloc/feedback_event.dart';
import 'package:skelter/presentation/feedback/constants/feedback_constants.dart';
import 'package:skelter/utils/extensions/primitive_types_extensions.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';
import 'package:skelter/validators/validators.dart';

class FeedbackMessageSection extends StatefulWidget {
  const FeedbackMessageSection({super.key});

  @override
  State<FeedbackMessageSection> createState() => _FeedbackMessageSectionState();
}

class _FeedbackMessageSectionState extends State<FeedbackMessageSection> {
  final _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _messageController.text = context.read<FeedbackBloc>().state.message;
    _messageController.addListener(messageControllerListener);
  }

  void messageControllerListener() {
    final String? previousError = context
        .read<FeedbackBloc>()
        .state
        .messageError;
    if (previousError != null && previousError.isNotEmpty) {
      context.read<FeedbackBloc>().add(
        const FeedbackMessageErrorEvent(error: ''),
      );
    }
    context.read<FeedbackBloc>().add(
      FeedbackMessageChangedEvent(message: _messageController.text),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final errorMessage = context.select<FeedbackBloc, String?>(
      (bloc) => bloc.state.messageError,
    );
    final message = context.select<FeedbackBloc, String>(
      (bloc) => bloc.state.message,
    );

    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          context.localization.your_feedback,
          style: AppTextStyles.p2SemiBold.copyWith(
            color: context.currentTheme.textNeutralPrimary,
          ),
        ),
        const SizedBox(height: 6),
        ClarityMask(
          child: TextFormField(
            controller: _messageController,
            style: AppTextStyles.p3Medium.copyWith(
              color: context.currentTheme.textNeutralPrimary,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: context.currentTheme.bgSurfaceBase2,
              hintText: context.localization.feedback_hint,
              hintStyle: AppTextStyles.p3Regular.copyWith(
                color: context.currentTheme.textNeutralDisable,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 16,
              ),
              errorText: errorMessage.isNullOrEmpty() ? null : errorMessage,
              counterText: '${message.length}/$kFeedbackMessageMaxLength',
              counterStyle: AppTextStyles.p4Regular.copyWith(
                color: context.currentTheme.textNeutralDisable,
              ),
              border: buildOutlineInputBorder(hasFocus: false),
              enabledBorder: buildOutlineInputBorder(hasFocus: false),
              focusedBorder: buildOutlineInputBorder(hasFocus: true),
              errorBorder: buildOutlineInputBorder(isErrorBorder: true),
              focusedErrorBorder: buildOutlineInputBorder(isErrorBorder: true),
            ),
            maxLines: 5,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) =>
                maxLengthValidator(value, kFeedbackMessageMaxLength, context),
            keyboardType: TextInputType.multiline,
          ),
        ),
      ],
    );
  }

  OutlineInputBorder buildOutlineInputBorder({
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
}
