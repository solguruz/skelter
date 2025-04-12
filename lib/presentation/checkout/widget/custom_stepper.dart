import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class CustomStepper extends StatefulWidget {
  const CustomStepper({super.key});

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  int activeStep = 0;

  @override
  Widget build(BuildContext context) {
    return EasyStepper(
      activeStep: activeStep,
      activeStepBackgroundColor: AppColors.brand500,
      internalPadding: 4,
      borderThickness: 2,
      titlesAreLargerThanSteps: true,
      fitWidth: false,
      defaultStepBorderType: BorderType.normal,
      enableStepTapping: false,
      lineStyle: const LineStyle(
        lineType: LineType.normal,
        lineThickness: 8,
        lineSpace: 4,
        lineLength: 35,
        unreachedLineColor: AppColors.brand50,
      ),
      stepRadius: 26,
      unreachedStepBorderColor: AppColors.brand500,
      unreachedStepBackgroundColor: AppColors.brand50,
      showLoadingAnimation: false,
      steps: [
        EasyStep(
          customStep: Icon(
            TablerIcons.shopping_cart,
            color: activeStep >= 0 ? AppColors.white : AppColors.bgBrandDefault,
          ),
          customTitle: Text(
            context.l10n.cart,
            textAlign: TextAlign.center,
          ),
        ),
        EasyStep(
          customStep: Icon(
            TablerIcons.truck_delivery,
            color: activeStep >= 1 ? AppColors.white : AppColors.bgBrandDefault,
          ),
          customTitle: Text(
            context.l10n.shipping,
            textAlign: TextAlign.center,
          ),
        ),
        EasyStep(
          customStep: Icon(
            TablerIcons.currency_dollar,
            color: activeStep >= 2 ? AppColors.white : AppColors.bgBrandDefault,
          ),
          customTitle: Text(
            context.l10n.payment,
            textAlign: TextAlign.center,
          ),
        ),
        EasyStep(
          customStep: Icon(
            TablerIcons.clipboard_text,
            color: activeStep >= 3 ? AppColors.white : AppColors.bgBrandDefault,
          ),
          customTitle: Text(
            context.l10n.order_review,
            textAlign: TextAlign.center,
          ),
        ),
      ],
      onStepReached: (index) => setState(() {
        // TODO: move in bloc
        activeStep = index;
      }),
    );
  }
}
