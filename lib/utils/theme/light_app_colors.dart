import 'dart:ui';

import 'package:skelter/utils/theme/theme_color_palette.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class LightAppColors implements ThemeColorPalette {
  @override
  Color get textBrandPrimary => AppColors.brand800;
  @override
  Color get textBrandSecondary => AppColors.brand700;
  @override
  Color get textBrandDisable => AppColors.brand300;
  @override
  Color get textBrandLight => AppColors.brand100;

  // Yellow (Warning)
  @override
  Color get textWarningPrimary => AppColors.yellowWarning900;
  @override
  Color get textWarningSecondary => AppColors.yellowWarning600;
  @override
  Color get textWarningDisable => AppColors.yellowWarning300;
  @override
  Color get textWarningLight => AppColors.yellowWarning100;

  // Red (Error)
  @override
  Color get textErrorPrimary => AppColors.redError900;
  @override
  Color get textErrorSecondary => AppColors.redError600;
  @override
  Color get textErrorDisable => AppColors.redError300;
  @override
  Color get textErrorLight => AppColors.redError100;

  // Green (Success)
  @override
  Color get textSuccessPrimary => AppColors.greenSuccess900;
  @override
  Color get textSuccessSecondary => AppColors.greenSuccess600;
  @override
  Color get textSuccessDisable => AppColors.greenSuccess300;
  @override
  Color get textSuccessLight => AppColors.greenSuccess100;

  // Neutral
  @override
  Color get textNeutralPrimary => AppColors.neutral900;
  @override
  Color get textNeutralSecondary => AppColors.neutral600;
  @override
  Color get textNeutralDisable => AppColors.neutral400;
  @override
  Color get textNeutralLight => AppColors.neutral100;
  @override
  Color get textNeutralWhite => AppColors.white;
  @override
  Color get textNeutralArticleParagraph => AppColors.neutral700;

  // Background Colors
  // Brand
  @override
  Color get bgBrandDefault => AppColors.brand600;
  @override
  Color get bgBrandHover => AppColors.brand500;
  @override
  Color get bgBrandPressed => AppColors.brand700;
  @override
  Color get bgBrandDisabled => AppColors.brand300;
  @override
  Color get bgBrandLight50 => AppColors.brand50;
  @override
  Color get bgBrandLight100 => AppColors.brand100;
  @override
  Color get bgBrandLight200 => AppColors.brand200;

  // Yellow (Warning)
  @override
  Color get bgWarningDefault => AppColors.yellowWarning600;
  @override
  Color get bgWarningHover => AppColors.yellowWarning500;
  @override
  Color get bgWarningPressed => AppColors.yellowWarning700;
  @override
  Color get bgWarningDisabled => AppColors.yellowWarning300;
  @override
  Color get bgWarningLight50 => AppColors.yellowWarning50;
  @override
  Color get bgWarningLight100 => AppColors.yellowWarning100;
  @override
  Color get bgWarningLight200 => AppColors.yellowWarning200;

  // Red (Error)
  @override
  Color get bgErrorDefault => AppColors.redError600;
  @override
  Color get bgErrorHover => AppColors.redError500;
  @override
  Color get bgErrorPressed => AppColors.redError700;
  @override
  Color get bgErrorDisabled => AppColors.redError300;
  @override
  Color get bgErrorLight50 => AppColors.redError50;
  @override
  Color get bgErrorLight100 => AppColors.redError100;
  @override
  Color get bgErrorLight200 => AppColors.redError200;

  // Green (Success)
  @override
  Color get bgSuccessDefault => AppColors.greenSuccess600;
  @override
  Color get bgSuccessHover => AppColors.greenSuccess500;
  @override
  Color get bgSuccessPressed => AppColors.greenSuccess700;
  @override
  Color get bgSuccessDisabled => AppColors.greenSuccess300;
  @override
  Color get bgSuccessLight50 => AppColors.greenSuccess50;
  @override
  Color get bgSuccessLight100 => AppColors.greenSuccess100;
  @override
  Color get bgSuccessLight200 => AppColors.greenSuccess200;

  // Neutral
  @override
  Color get bgNeutralDefault => AppColors.neutral800;
  @override
  Color get bgNeutralHover => AppColors.neutral500;
  @override
  Color get bgNeutralPressed => AppColors.neutral700;
  @override
  Color get bgNeutralDisabled => AppColors.neutral100;
  @override
  Color get bgNeutralLight50 => AppColors.neutral50;
  @override
  Color get bgNeutralLight100 => AppColors.neutral100;
  @override
  Color get bgNeutralLight200 => AppColors.neutral200;

  // Shades
  @override
  Color get bgShadesWhite => AppColors.shadesWhite;
  @override
  Color get bgShadesBlack => AppColors.shadesBlack;

  // Icon Colors
  // Brand
  @override
  Color get iconBrandPrimary => AppColors.brand800;
  @override
  Color get iconBrandHover => AppColors.brand700;
  @override
  Color get iconBrandPressed => AppColors.brand400;
  @override
  Color get iconBrandDisabled => AppColors.brand300;

  // Yellow (Warning)
  @override
  Color get iconWarningDefault => AppColors.yellowWarning900;
  @override
  Color get iconWarningHover => AppColors.yellowWarning500;
  @override
  Color get iconWarningPressed => AppColors.yellowWarning400;
  @override
  Color get iconWarningDisabled => AppColors.yellowWarning300;

  // Red (Error)
  @override
  Color get iconErrorDefault => AppColors.redError900;
  @override
  Color get iconErrorHover => AppColors.redError500;
  @override
  Color get iconErrorPressed => AppColors.redError400;
  @override
  Color get iconErrorDisabled => AppColors.redError300;

  // Green (Success)
  @override
  Color get iconSuccessDefault => AppColors.greenSuccess900;
  @override
  Color get iconSuccessHover => AppColors.greenSuccess500;
  @override
  Color get iconSuccessPressed => AppColors.greenSuccess400;
  @override
  Color get iconSuccessDisabled => AppColors.greenSuccess300;

  // Neutral
  @override
  Color get iconNeutralDefault => AppColors.neutral900;
  @override
  Color get iconNeutralHover => AppColors.neutral500;
  @override
  Color get iconNeutralPressed => AppColors.neutral400;
  @override
  Color get iconNeutralDisabled => AppColors.neutral300;

  // Stroke Colors
  // Brand
  @override
  Color get strokeBrandDefault => AppColors.brand700;
  @override
  Color get strokeBrandHover => AppColors.brand600;
  @override
  Color get strokeBrandPressed => AppColors.brand800;
  @override
  Color get strokeBrandDisabled => AppColors.brand300;

  // Yellow (Warning)
  @override
  Color get strokeWarningDefault => AppColors.yellowWarning600;
  @override
  Color get strokeWarningHover => AppColors.yellowWarning500;
  @override
  Color get strokeWarningPressed => AppColors.yellowWarning700;
  @override
  Color get strokeWarningDisabled => AppColors.yellowWarning300;

  // Red (Error)
  @override
  Color get strokeErrorDefault => AppColors.redError600;
  @override
  Color get strokeErrorHover => AppColors.redError500;
  @override
  Color get strokeErrorPressed => AppColors.redError700;
  @override
  Color get strokeErrorDisabled => AppColors.redError300;

  // Green (Success)
  @override
  Color get strokeSuccessDefault => AppColors.greenSuccess600;
  @override
  Color get strokeSuccessHover => AppColors.greenSuccess500;
  @override
  Color get strokeSuccessPressed => AppColors.greenSuccess700;
  @override
  Color get strokeSuccessDisabled => AppColors.greenSuccess300;

  // Neutral
  @override
  Color get strokeNeutralDefault => AppColors.neutral600;
  @override
  Color get strokeNeutralHover => AppColors.neutral500;
  @override
  Color get strokeNeutralPressed => AppColors.neutral700;
  @override
  Color get strokeNeutralDisabled => AppColors.neutral400;
  @override
  Color get strokeNeutralLight50 => AppColors.neutral50;
  @override
  Color get strokeNeutralLight100 => AppColors.neutral100;
  @override
  Color get strokeNeutralLight200 => AppColors.neutral200;

  // Shades
  @override
  Color get strokeShadesWhite => AppColors.white;
  @override
  Color get strokeShadesBlack => AppColors.black;

  @override
  Color get bgSurfaceBase2 => AppColors.bgSurfaceBase2;

  @override
  Color get bgSurfaceBase => AppColors.bgSurfaceBase;

  // Gradient Overlay Colors
  @override
  Color get gradientOverlayTransparent => AppColors.white.withOpacity(0.0);
  @override
  Color get gradientOverlayMedium => AppColors.white.withOpacity(0.78);
  @override
  Color get gradientOverlaySolid => AppColors.white;

  // Indigo
  @override
  Color get bgIndigoDefault => AppColors.bgIndigoDefault;
}
