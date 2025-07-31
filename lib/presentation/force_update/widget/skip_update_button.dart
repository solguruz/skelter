import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/force_update/bloc/force_update_bloc.dart';
import 'package:flutter_skeleton/presentation/force_update/bloc/force_update_event.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_size_enum.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_style_enum.dart';

class SkipUpdateButton extends StatelessWidget {
  const SkipUpdateButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isMandatoryUpdate = context.select<ForceUpdateBloc, bool>(
      (bloc) => bloc.state.isMandatoryUpdate,
    );

    return !isMandatoryUpdate
        ? AppButton(
            label: context.localization.skip_update,
            shouldSetFullWidth: true,
            style: AppButtonStyle.textOrIcon,
            size: AppButtonSize.extraLarge,
            onPressed: () {
              context.read<ForceUpdateBloc>().add(SkipUpdateEvent());
            },
          )
        : const SizedBox.shrink();
  }
}
