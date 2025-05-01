import 'package:flutter/material.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/checkout/bloc/checkout_bloc.dart';
import 'package:flutter_skeleton/presentation/checkout/bloc/checkout_events.dart';
import 'package:flutter_skeleton/presentation/checkout/initial_checkout_page.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/custom_stepper.dart';
import 'package:flutter_skeleton/widgets/app_button/app_button.dart';

class SelectAndReviewOrderCTA extends StatelessWidget {
  const SelectAndReviewOrderCTA({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      label: context.l10n.select_and_review_order,
      size: AppButtonSize.xl,
      onPressed: () {
        final currentStepperIndex = context.checkoutBloc.state.stepperIndex;
        if (currentStepperIndex < CustomStepper.steps(context).length - 1) {
          context.checkoutBloc
              .add(StepperIndexUpdateEvent(index: currentStepperIndex + 1));
          CheckoutPageBody.scrollController.jumpTo(0);
        }
      },
    );
  }
}
