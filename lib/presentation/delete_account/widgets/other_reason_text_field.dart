import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/delete_account/bloc/delete_account_bloc.dart';
import 'package:skelter/presentation/delete_account/bloc/delete_account_event.dart';
import 'package:skelter/presentation/delete_account/enum/delete_account_reasons.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';

class OtherReasonTextField extends StatefulWidget {
  const OtherReasonTextField({super.key});

  @override
  State<OtherReasonTextField> createState() => _OtherReasonTextFieldState();
}

class _OtherReasonTextFieldState extends State<OtherReasonTextField> {
  final TextEditingController _otherReasonController = TextEditingController();
  final _debouncer = Debouncer<String>(
    const Duration(milliseconds: 300),
    initialValue: '',
  );

  @override
  void initState() {
    super.initState();

    _otherReasonController.text =
        context.read<DeleteAccountBloc>().state.otherReasonText;

    _otherReasonController.addListener(() {
      _debouncer.value = _otherReasonController.text.trim();
    });

    _debouncer.values.listen((text) {
      context.read<DeleteAccountBloc>().add(
            DeleteOtherReasonTextChangedEvent(text: text),
          );
    });
  }

  @override
  void dispose() {
    _otherReasonController.dispose();
    _debouncer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedReason =
        context.select<DeleteAccountBloc, DeleteAccountReasons?>(
      (bloc) => bloc.state.selectedReason,
    );

    if (selectedReason != DeleteAccountReasons.other) {
      return const SizedBox.shrink();
    }

    return TextField(
      controller: _otherReasonController,
      maxLines: 3,
      style: AppTextStyles.p2Regular
          .copyWith(color: context.currentTheme.textNeutralPrimary),
      decoration: InputDecoration(
        hintText: context.localization.specify_reason,
        border: buildOutlineInputBorder(hasFocus: false),
        enabledBorder: buildOutlineInputBorder(hasFocus: false),
        focusedBorder: buildOutlineInputBorder(hasFocus: true),
        errorBorder: buildOutlineInputBorder(isErrorBorder: true),
      ),
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
