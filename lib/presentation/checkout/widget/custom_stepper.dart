import 'package:easy_stepper/easy_stepper.dart';
// easy_stepper still builds its steps with the legacy
// `package:flutter/material.dart` InkWell, which needs a legacy Material.
import 'package:flutter/material.dart' as legacy;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/checkout/bloc/checkout_bloc.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';
import 'package:skelter/widgets/legacy_material_scope.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper({super.key});

  @override
  Widget build(BuildContext context) {
    final currentStepperIndex = context.select<CheckoutBloc, int>(
      (bloc) => bloc.state.stepperIndex,
    );

    return LegacyMaterialScope(
      child: legacy.Material(
        type: legacy.MaterialType.transparency,
        child: EasyStepper(
          activeStep: currentStepperIndex,
          activeStepBackgroundColor: context.currentTheme.bgBrandDefault,
          internalPadding: 0,
          borderThickness: 2,
          disableScroll: true,
          titlesAreLargerThanSteps: true,
          fitWidth: false,
          defaultStepBorderType: BorderType.normal,
          enableStepTapping: false,
          lineStyle: LineStyle(
            lineType: LineType.normal,
            lineThickness: 5,
            unreachedLineColor: context.currentTheme.bgBrandLight50,
            activeLineColor: context.currentTheme.bgBrandLight50,
            finishedLineColor: context.currentTheme.bgBrandDefault,
          ),
          stepRadius: 26,
          unreachedStepBorderColor: context.currentTheme.bgBrandHover,
          unreachedStepBackgroundColor: context.currentTheme.bgBrandLight50,
          activeStepIconColor: AppColors.shadesWhite,
          unreachedStepIconColor: context.currentTheme.bgBrandDefault,
          finishedStepIconColor: AppColors.shadesWhite,
          finishedStepBackgroundColor: context.currentTheme.bgBrandDefault,
          showLoadingAnimation: false,
          steps: steps(context),
        ),
      ),
    );
  }

  static List<EasyStep> steps(BuildContext context) {
    return [
      EasyStep(
        icon: const Icon(TablerIcons.shopping_cart),
        customTitle: Text(
          context.localization.cart,
          textAlign: .center,
          style: AppTextStyles.p3Regular.copyWith(
            color: context.currentTheme.textNeutralPrimary,
          ),
        ),
      ),
      EasyStep(
        icon: const Icon(TablerIcons.truck_delivery),
        customTitle: Text(
          context.localization.shipping,
          textAlign: .center,
          style: AppTextStyles.p3Regular.copyWith(
            color: context.currentTheme.textNeutralPrimary,
          ),
        ),
      ),
      EasyStep(
        icon: const Icon(TablerIcons.currency_dollar),
        customTitle: Text(
          context.localization.payment,
          textAlign: .center,
          style: AppTextStyles.p3Regular.copyWith(
            color: context.currentTheme.textNeutralPrimary,
          ),
        ),
      ),
      EasyStep(
        icon: const Icon(TablerIcons.clipboard_text),
        customTitle: Text(
          context.localization.order_review,
          textAlign: .center,
          style: AppTextStyles.p3Regular.copyWith(
            color: context.currentTheme.textNeutralPrimary,
          ),
          softWrap: false,
        ),
      ),
    ];
  }
}
