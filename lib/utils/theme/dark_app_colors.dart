import 'dart:ui';

import 'package:skelter/utils/theme/theme_color_palette.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class DarkAppColors implements ThemeColorPalette {
  @override
  Color get textBrandPrimary => AppColors.brand50;
  @override
  Color get textBrandSecondary => AppColors.brand400;
  @override
  Color get textBrandDisable => AppColors.brand500;
  @override
  Color get textBrandLight => AppColors.brand800;

  // Yellow (Warning)
  @override
  Color get textWarningPrimary => AppColors.yellowWarning50;
  @override
  Color get textWarningSecondary => AppColors.yellowWarning400;
  @override
  Color get textWarningDisable => AppColors.yellowWarning600;
  @override
  Color get textWarningLight => AppColors.yellowWarning800;

  // Red (Error)
  @override
  Color get textErrorPrimary => AppColors.redError50;
  @override
  Color get textErrorSecondary => AppColors.redError400;
  @override
  Color get textErrorDisable => AppColors.redError600;
  @override
  Color get textErrorLight => AppColors.redError800;

  // Green (Success)
  @override
  Color get textSuccessPrimary => AppColors.greenSuccess50;
  @override
  Color get textSuccessSecondary => AppColors.greenSuccess400;
  @override
  Color get textSuccessDisable => AppColors.greenSuccess600;
  @override
  Color get textSuccessLight => AppColors.greenSuccess800;

  // Neutral
  @override
  Color get textNeutralPrimary => AppColors.neutral50;
  @override
  Color get textNeutralSecondary => AppColors.neutral300;
  @override
  Color get textNeutralDisable => AppColors.neutral500;
  @override
  Color get textNeutralLight => AppColors.neutral100;
  @override
  Color get textNeutralWhite => AppColors.white;
  @override
  Color get textNeutralArticleParagraph => AppColors.neutral300;

  // Background Colors
  // Brand
  @override
  Color get bgBrandDefault => AppColors.brand500;
  @override
  Color get bgBrandHover => AppColors.brand400;
  @override
  Color get bgBrandPressed => AppColors.brand600;
  @override
  Color get bgBrandDisabled => AppColors.brand900;

  // how?
  @override
  Color get bgBrandLight50 => AppColors.brand500.withOpacity(0.3);
  @override
  Color get bgBrandLight100 => AppColors.brand500.withOpacity(0.5);
  @override
  Color get bgBrandLight200 => AppColors.brand200;

  // Yellow (Warning)
  @override
  Color get bgWarningDefault => AppColors.yellowWarning600;
  @override
  Color get bgWarningHover => AppColors.yellowWarning500;
  @override
  Color get bgWarningPressed => AppColors.yellowWarning600;
  @override
  Color get bgWarningDisabled => AppColors.yellowWarning900;

  // how?
  @override
  Color get bgWarningLight50 => AppColors.yellowWarning50;
  @override
  Color get bgWarningLight100 => AppColors.yellowWarning100;
  @override
  Color get bgWarningLight200 => AppColors.yellowWarning200;

  // Red (Error)
  @override
  Color get bgErrorDefault => AppColors.redError500;
  @override
  Color get bgErrorHover => AppColors.redError400;
  @override
  Color get bgErrorPressed => AppColors.redError600;
  @override
  Color get bgErrorDisabled => AppColors.redError800;

  //how?
  @override
  Color get bgErrorLight50 => AppColors.redError50;
  @override
  Color get bgErrorLight100 => AppColors.redError100;
  @override
  Color get bgErrorLight200 => AppColors.redError200;

  // Green (Success)
  @override
  Color get bgSuccessDefault => AppColors.greenSuccess500;
  @override
  Color get bgSuccessHover => AppColors.greenSuccess400;
  @override
  Color get bgSuccessPressed => AppColors.greenSuccess600;
  @override
  Color get bgSuccessDisabled => AppColors.greenSuccess800;

  //how?
  @override
  Color get bgSuccessLight50 => AppColors.greenSuccess50;
  @override
  Color get bgSuccessLight100 => AppColors.greenSuccess100;
  @override
  Color get bgSuccessLight200 => AppColors.greenSuccess200;

  // Neutral
  @override
  Color get bgNeutralDefault => AppColors.dark600;
  @override
  Color get bgNeutralHover => AppColors.dark500;
  @override
  Color get bgNeutralPressed => AppColors.dark400;
  @override
  Color get bgNeutralDisabled => AppColors.dark800;
  @override
  Color get bgNeutralLight50 => AppColors.dark700;
  @override
  Color get bgNeutralLight100 => AppColors.dark900;
  @override
  Color get bgNeutralLight200 => AppColors.dark800;

  // Shades
  @override
  Color get bgShadesWhite => AppColors.shadesBlack;
  @override
  Color get bgShadesBlack => AppColors.shadesWhite;

  // Icon Colors
  // Brand
  @override
  Color get iconBrandPrimary => AppColors.brand50;
  @override
  Color get iconBrandHover => AppColors.brand400;
  @override
  Color get iconBrandPressed => AppColors.brand300;
  @override
  Color get iconBrandDisabled => AppColors.brand600;

  // Yellow (Warning)
  @override
  Color get iconWarningDefault => AppColors.yellowWarning50;
  @override
  Color get iconWarningHover => AppColors.yellowWarning400;
  @override
  Color get iconWarningPressed => AppColors.yellowWarning300;
  @override
  Color get iconWarningDisabled => AppColors.yellowWarning600;

  // Red (Error)
  @override
  Color get iconErrorDefault => AppColors.redError50;
  @override
  Color get iconErrorHover => AppColors.redError400;
  @override
  Color get iconErrorPressed => AppColors.redError300;
  @override
  Color get iconErrorDisabled => AppColors.redError600;

  // Green (Success)
  @override
  Color get iconSuccessDefault => AppColors.greenSuccess50;
  @override
  Color get iconSuccessHover => AppColors.greenSuccess400;
  @override
  Color get iconSuccessPressed => AppColors.greenSuccess300;
  @override
  Color get iconSuccessDisabled => AppColors.greenSuccess600;

  // Neutral
  @override
  Color get iconNeutralDefault => AppColors.neutral50;
  @override
  Color get iconNeutralHover => AppColors.neutral400;
  @override
  Color get iconNeutralPressed => AppColors.neutral600;
  @override
  Color get iconNeutralDisabled => AppColors.neutral500;

  // Stroke Colors
  // Brand
  @override
  Color get strokeBrandDefault => AppColors.brand400;
  @override
  Color get strokeBrandHover => AppColors.brand300;
  @override
  Color get strokeBrandPressed => AppColors.brand600;
  @override
  Color get strokeBrandDisabled => AppColors.brand600;

  // Yellow (Warning)
  @override
  Color get strokeWarningDefault => AppColors.yellowWarning500;
  @override
  Color get strokeWarningHover => AppColors.yellowWarning400;
  @override
  Color get strokeWarningPressed => AppColors.yellowWarning600;
  @override
  Color get strokeWarningDisabled => AppColors.yellowWarning600;

  // Red (Error)
  @override
  Color get strokeErrorDefault => AppColors.redError500;
  @override
  Color get strokeErrorHover => AppColors.redError400;
  @override
  Color get strokeErrorPressed => AppColors.redError600;
  @override
  Color get strokeErrorDisabled => AppColors.redError600;

  // Green (Success)
  @override
  Color get strokeSuccessDefault => AppColors.greenSuccess500;
  @override
  Color get strokeSuccessHover => AppColors.greenSuccess400;
  @override
  Color get strokeSuccessPressed => AppColors.greenSuccess600;
  @override
  Color get strokeSuccessDisabled => AppColors.greenSuccess600;

  // Neutral
  @override
  Color get strokeNeutralDefault => AppColors.neutral400;
  @override
  Color get strokeNeutralHover => AppColors.neutral500;
  @override
  Color get strokeNeutralPressed => AppColors.neutral700;
  @override
  Color get strokeNeutralDisabled => AppColors.neutral500;
  @override
  Color get strokeNeutralLight50 => AppColors.neutral700;
  @override
  Color get strokeNeutralLight100 => AppColors.neutral800;
  @override
  Color get strokeNeutralLight200 => AppColors.dark300;

  // Shades
  @override
  Color get strokeShadesWhite => AppColors.white;
  @override
  Color get strokeShadesBlack => AppColors.black;

  @override
  Color get bgSurfaceBase2 => AppColors.bgSurfaceBase2dark;

  @override
  Color get bgSurfaceBase => AppColors.bgSurfaceBaseDark;

  // Gradient Overlay Colors
  @override
  Color get gradientOverlayTransparent => AppColors.black.withOpacity(0.0);
  @override
  Color get gradientOverlayMedium => AppColors.black.withOpacity(0.78);
  @override
  Color get gradientOverlaySolid => AppColors.black;

  // Indigo
  @override
  Color get bgIndigoDefault => AppColors.bgIndigoDefault;
}
