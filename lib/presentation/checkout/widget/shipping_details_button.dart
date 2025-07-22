import 'package:flutter/material.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/checkout/bloc/checkout_bloc.dart';
import 'package:flutter_skeleton/presentation/checkout/bloc/checkout_events.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/custom_stepper.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';
import 'package:flutter_skeleton/widgets/app_button/enums/app_button_size_enum.dart';

class ShippingDetailsButton extends StatelessWidget {
  const ShippingDetailsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      label: context.localization.add_shipping_details,
      size: AppButtonSize.extraLarge,
      onPressed: () {
        final currentStepperIndex = context.checkoutBloc.state.stepperIndex;
        if (currentStepperIndex < CustomStepper.steps(context).length - 1) {
          context.checkoutBloc
              .add(StepperIndexUpdateEvent(index: currentStepperIndex + 1));
        }
      },
    );
  }
}
