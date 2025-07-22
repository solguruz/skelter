import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/delete_account/bloc/delete_account_bloc.dart';
import 'package:flutter_skeleton/presentation/delete_account/bloc/delete_account_event.dart';
import 'package:flutter_skeleton/presentation/delete_account/enum/delete_account_reasons.dart';

class OtherReasonTextField extends StatefulWidget {
  const OtherReasonTextField({super.key});

  @override
  State<OtherReasonTextField> createState() => _OtherReasonTextFieldState();
}

class _OtherReasonTextFieldState extends State<OtherReasonTextField> {
  late final TextEditingController _controller;
  final _debouncer = Debouncer<String>(
    const Duration(milliseconds: 300),
    initialValue: '',
  );

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final text = context.read<DeleteAccountBloc>().state.otherReasonText;
      _controller = TextEditingController(text: text);

      _controller.addListener(() {
        _debouncer.value = _controller.text;
      });

      _debouncer.values.listen((text) {
        context.deleteAccountBloc.add(
          DeleteOtherReasonTextChangedEvent(text: text),
        );
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
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
      controller: _controller,
      maxLines: 2,
      decoration: InputDecoration(
        hintText: context.localization.specify_reason,
      ),
    );
  }
}
