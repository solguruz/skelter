import 'package:clarity_flutter/clarity_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/checkout/bloc/checkout_bloc.dart';
import 'package:skelter/presentation/checkout/bloc/checkout_events.dart';
import 'package:skelter/presentation/checkout/constants/analytics_constant.dart';
import 'package:skelter/presentation/checkout/widget/custom_stepper.dart';
import 'package:skelter/utils/theme/extention/theme_extension.dart';
import 'package:skelter/widgets/app_button/app_button.dart';
import 'package:skelter/widgets/app_button/enums/app_button_size_enum.dart';

class ConfirmAndPayButton extends StatelessWidget {
  const ConfirmAndPayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      label: context.localization.confirm_and_pay,
      foregroundColor: context.currentTheme.textNeutralLight,
      size: AppButtonSize.extraLarge,
      onPressed: () {
        final currentStepperIndex =
            context.read<CheckoutBloc>().state.stepperIndex;

        Clarity.sendCustomEvent(kClarityEventConfirmAndPayStepChecked);

        if (currentStepperIndex < CustomStepper.steps(context).length - 1) {
          context
              .read<CheckoutBloc>()
              .add(StepperIndexUpdateEvent(index: currentStepperIndex + 1));
        }
      },
    );
  }
}
