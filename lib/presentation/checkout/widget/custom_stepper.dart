import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/checkout/bloc/checkout_bloc.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper({super.key});

  @override
  Widget build(BuildContext context) {
    final currentStepperIndex = context.select<CheckoutBloc, int>(
      (bloc) => bloc.state.stepperIndex,
    );

    return EasyStepper(
      activeStep: currentStepperIndex,
      activeStepBackgroundColor: AppColors.brand500,
      internalPadding: 0,
      borderThickness: 2,
      disableScroll: true,
      titlesAreLargerThanSteps: true,
      fitWidth: false,
      defaultStepBorderType: BorderType.normal,
      enableStepTapping: false,
      lineStyle: const LineStyle(
        lineType: LineType.normal,
        lineThickness: 5,
        unreachedLineColor: AppColors.brand50,
        activeLineColor: AppColors.brand50,
        finishedLineColor: AppColors.brand500,
      ),
      stepRadius: 26,
      unreachedStepBorderColor: AppColors.brand500,
      unreachedStepBackgroundColor: AppColors.brand50,
      activeStepIconColor: AppColors.white,
      unreachedStepIconColor: AppColors.bgBrandDefault,
      finishedStepIconColor: AppColors.white,
      showLoadingAnimation: false,
      steps: steps(context),
    );
  }

  static List<EasyStep> steps(BuildContext context) {
    return [
      EasyStep(
        icon: const Icon(TablerIcons.shopping_cart),
        customTitle: Text(
          context.localization.cart,
          textAlign: TextAlign.center,
        ),
      ),
      EasyStep(
        icon: const Icon(TablerIcons.truck_delivery),
        customTitle: Text(
          context.localization.shipping,
          textAlign: TextAlign.center,
        ),
      ),
      EasyStep(
        icon: const Icon(TablerIcons.currency_dollar),
        customTitle: Text(
          context.localization.payment,
          textAlign: TextAlign.center,
        ),
      ),
      EasyStep(
        icon: const Icon(TablerIcons.clipboard_text),
        customTitle: Text(
          context.localization.order_review,
          textAlign: TextAlign.center,
          softWrap: false,
        ),
      ),
    ];
  }
}
