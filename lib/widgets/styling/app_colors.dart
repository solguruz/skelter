import 'package:flutter/material.dart';

class AppColors {
  static bool isLightMode([BuildContext? context]) => true;

  static const MaterialColor primarySwatches =
      MaterialColor(0xFF3559E9, <int, Color>{
    50: Color.fromRGBO(235, 241, 255, .1),
    100: Color.fromRGBO(213, 226, 255, .2),
    200: Color.fromRGBO(192, 213, 255, .3),
    300: Color.fromRGBO(151, 186, 255, .4),
    400: Color.fromRGBO(104, 149, 255, .5),
    500: Color.fromRGBO(51, 92, 255, .6),
    600: Color.fromRGBO(53, 89, 233, .7),
    700: Color.fromRGBO(37, 71, 208, .8),
    800: Color.fromRGBO(31, 59, 173, .9),
    900: Color.fromRGBO(24, 47, 139, 1.0),
  });

  static const Color blue = Color(0xFF8EB6F9);
  static const Color sherpaBlue = Color(0xFF0DAED9);
  static const Color yellow = Color(0xFFFFB619);
  static const Color teal = Color(0xFF00AAA1);
  static const Color indigo = Color(0xFF7B41DA);
  static const Color red = Color(0xFFF34D34);
  static const Color pink = Color(0xFFDB2777);
  static const Color challengesDraft = Color(0xFF242424);
  static const Color fadedPrimaryColor = Color(0xFFEBFCE4);
  static const Color errorColor = Color(0xFFF34D34);
  static const Color bgColorDark = Color(0xFF121212);
  static const Color bottomAppBarColorDark = Color(0xFF000000);
  static const Color bottomAppBarColorLight = Color(0xFFF4F4F4);
  static const Color snackBarErrorColor = Color(0xF2616161);
  static const Color snackBarBGColor = Color(0xff54545D);
  static const Color offWhite = Color(0xFFF4F4F4);
  static const Color screenGreen = Color(0xFF00843D);
  static const Color someGreyColor = Color(0xFFFFB619);
  static const Color bottomLabelsGreyColor = Color(0xFF686868);
  static const Color participantTitle = Color(0xFFF8F8F9);
  static const Color unselectedColor = Color(0xFF414152);
  static const Color feedButtonBgColor = Color(0x40000000);
  static const Color postMediaGradientColor = Color(0x40000000);
  static const Color popupMenuIconColor = Color(0xFF282828);
  static const Color shadowColor = Color(0x14202120);
  static const Color shadowColor2 = Color(0x55555512);
  static const Color shadowColor3 = Color(0x40000000);
  static const Color imageOverlay = Color(0x80000000);
  static const Color gridCounterOverlay = Color(0xB3050505);
  static const Color transparent = Color(0x00000000);
  static const Color indicatorUnselected = Color(0x1AF2FEF7);
  static const Color indicatorUnselectedV2 = Color(0xFFD9D9D9);

  static const Color darkCardColor = Color(0xFF151518);
  static const Color redWarning = Color(0xFFEA4338);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color shadesWhite = Color(0xFFFFFFFF);
  static const Color shadesBlack = Color(0xFF050505);
  static const Color captionBGGradient1 = Color(0xDB050505);
  static const Color captionBGGradient2 = Color(0x57050505);

  static const Color neutral50 = Color(0xFFF8F8F8);
  static const Color neutral100 = Color(0xFFE3E3E3);
  static const Color neutral200 = Color(0xFFCDCFCE);
  static const Color neutral300 = Color(0xFFB1B3B2);
  static const Color neutral400 = Color(0xFF959796);
  static const Color neutral500 = Color(0xFF77808D);
  static const Color neutral600 = Color(0xFF565857);
  static const Color neutral700 = Color(0xFF414241);
  static const Color neutral800 = Color(0xFF303130);
  static const Color neutral900 = Color(0xFF202120);
  static const Color neutral950 = Color(0xFF101010);

  static const Color brand50 = Color(0xFFEBF1FF);
  static const Color brand100 = Color(0xFFD5E2FF);
  static const Color brand200 = Color(0xFFC0D5FF);
  static const Color brand300 = Color(0xFF97BAFF);
  static const Color brand400 = Color(0xFF6895FF);
  static const Color brand500 = Color(0xFF335CFF);
  static const Color brand600 = Color(0xFF3559E9);
  static const Color brand700 = Color(0xFF2547D0);
  static const Color brand800 = Color(0xFF1F3BAD);
  static const Color brand900 = Color(0xFF182F8B);
  static const Color brand950 = Color(0xFF122368);

  static const Color greenSuccess50 = Color(0xFFF0FDF4);
  static const Color greenSuccess100 = Color(0xFFDCFCE7);
  static const Color greenSuccess200 = Color(0xFFBBF7D0);
  static const Color greenSuccess300 = Color(0xFF86EFAC);
  static const Color greenSuccess400 = Color(0xFF4ADE80);
  static const Color greenSuccess500 = Color(0xFF22C55E);
  static const Color greenSuccess600 = Color(0xFF16A34A);
  static const Color greenSuccess700 = Color(0xFF15803D);
  static const Color greenSuccess800 = Color(0xFF166534);
  static const Color greenSuccess900 = Color(0xFF14532D);
  static const Color greenSuccess950 = Color(0xFF052E16);

  static const Color yellowWarning50 = Color(0xFFFFFBE8);
  static const Color yellowWarning100 = Color(0xFFFEF3C7);
  static const Color yellowWarning200 = Color(0xFFFDE68A);
  static const Color yellowWarning300 = Color(0xFFFDE047);
  static const Color yellowWarning400 = Color(0xFFFBBF24);
  static const Color yellowWarning500 = Color(0xFFF59E0B);
  static const Color yellowWarning600 = Color(0xFFD97706);
  static const Color yellowWarning700 = Color(0xFFB45309);
  static const Color yellowWarning800 = Color(0xFF92400E);
  static const Color yellowWarning900 = Color(0xFF78350F);
  static const Color yellowWarning950 = Color(0xFF451A03);

  static const Color redError50 = Color(0xFFFEF2F2);
  static const Color redError100 = Color(0xFFFEE2E2);
  static const Color redError200 = Color(0xFFFECACA);
  static const Color redError300 = Color(0xFFFCA5A5);
  static const Color redError400 = Color(0xFFF87171);
  static const Color redError500 = Color(0xFFDC2626);
  static const Color redError600 = Color(0xFFDC2626);
  static const Color redError700 = Color(0xFFB91C1C);
  static const Color redError800 = Color(0xFF991B1B);
  static const Color redError900 = Color(0xFF7F1D1D);
  static const Color redError950 = Color(0xFF450A0A);

  static const Color dark50 = Color(0xFF3D413F);
  static const Color dark100 = Color(0xFF383C3A);
  static const Color dark200 = Color(0xFF363A38);
  static const Color dark300 = Color(0xFF333735);
  static const Color dark400 = Color(0xFF2E3330);
  static const Color dark500 = Color(0xFF2C312E);
  static const Color dark600 = Color(0xFF272C29);
  static const Color dark700 = Color(0xFF252A27);
  static const Color dark800 = Color(0xFF232725);
  static const Color dark900 = Color(0xFF1E2320);
  static const Color dark950 = Color(0xFF121714);

  // Gradient colors
  static const Color black80 = Color(0xCC000000);
  static const Color black05 = Color(0x0D000000);

  // Reaction (Emoji) background colors
  static const Color heartReactionBG = Color(0xFFFFC7D4);
  static const Color laughReactionBG = Color(0xFFD6E3F3);
  static const Color cryingReactionBG = Color(0xFFEED6EA);
  static const Color clapReactionBG = Color(0xFFD6F3D9);
  static const Color faceWithHandOverMouthReactionBG = Color(0xFFD6E3F3);
  static const Color bulbReactionBG = Color(0xFFEED6EA);
  static const Color thinkingReactionBG = Color(0xFFD6F3D9);

  static const Color metaSectionBorderColor = Color(0xFFEAEAEA);
  static const Color bgOrangeLight = Color(0xFFFED7AA);

// ------------------ Widget Colors ---------------------------

  //  Text Colors
  // Brand
  static const Color textBrandPrimary = AppColors.brand800;
  static const Color textBrandSecondary = AppColors.brand700;
  static const Color textBrandDisable = AppColors.brand300;
  static const Color textBrandLight = AppColors.brand100;

  // Yellow (Warning)
  static const Color textWarningPrimary = AppColors.yellowWarning900;
  static const Color textWarningSecondary = AppColors.yellowWarning600;
  static const Color textWarningDisable = AppColors.yellowWarning300;
  static const Color textWarningLight = AppColors.yellowWarning100;

  // Red (Error)
  static const Color textErrorPrimary = AppColors.redError900;
  static const Color textErrorSecondary = AppColors.redError600;
  static const Color textErrorDisable = AppColors.redError300;
  static const Color textErrorLight = AppColors.redError100;

  // Green (Success)
  static const Color textSuccessPrimary = AppColors.greenSuccess900;
  static const Color textSuccessSecondary = AppColors.greenSuccess600;
  static const Color textSuccessDisable = AppColors.greenSuccess300;
  static const Color textSuccessLight = AppColors.greenSuccess100;

  // Neutral
  static const Color textNeutralPrimary = AppColors.neutral900;
  static const Color textNeutralSecondary = AppColors.neutral600;
  static const Color textNeutralDisable = AppColors.neutral400;
  static const Color textNeutralLight = AppColors.neutral100;
  static const Color textNeutralWhite = AppColors.white;
  static const Color textNeutralArticleParagraph = AppColors.neutral700;

  // Background Colors
  // Brand
  static const Color bgBrandDefault = AppColors.brand600;
  static const Color bgBrandHover = AppColors.brand500;
  static const Color bgBrandPressed = AppColors.brand700;
  static const Color bgBrandDisabled = AppColors.brand300;
  static const Color bgBrandLight50 = AppColors.brand50;
  static const Color bgBrandLight100 = AppColors.brand100;
  static const Color bgBrandLight200 = AppColors.brand200;

  // Yellow (Warning)
  static const Color bgWarningDefault = AppColors.yellowWarning600;
  static const Color bgWarningHover = AppColors.yellowWarning500;
  static const Color bgWarningPressed = AppColors.yellowWarning700;
  static const Color bgWarningDisabled = AppColors.yellowWarning300;
  static const Color bgWarningLight50 = AppColors.yellowWarning50;
  static const Color bgWarningLight100 = AppColors.yellowWarning100;
  static const Color bgWarningLight200 = AppColors.yellowWarning200;

  // Red (Error)
  static const Color bgErrorDefault = AppColors.redError600;
  static const Color bgErrorHover = AppColors.redError500;
  static const Color bgErrorPressed = AppColors.redError700;
  static const Color bgErrorDisabled = AppColors.redError300;
  static const Color bgErrorLight50 = AppColors.redError50;
  static const Color bgErrorLight100 = AppColors.redError100;
  static const Color bgErrorLight200 = AppColors.redError200;

  // Green (Success)
  static const Color bgSuccessDefault = AppColors.greenSuccess600;
  static const Color bgSuccessHover = AppColors.greenSuccess500;
  static const Color bgSuccessPressed = AppColors.greenSuccess700;
  static const Color bgSuccessDisabled = AppColors.greenSuccess300;
  static const Color bgSuccessLight50 = AppColors.greenSuccess50;
  static const Color bgSuccessLight100 = AppColors.greenSuccess100;
  static const Color bgSuccessLight200 = AppColors.greenSuccess200;

  // Neutral
  static const Color bgNeutralDefault = AppColors.neutral800;
  static const Color bgNeutralHover = AppColors.neutral500;
  static const Color bgNeutralPressed = AppColors.neutral700;
  static const Color bgNeutralDisabled = AppColors.neutral100;
  static const Color bgNeutralLight50 = AppColors.neutral50;
  static const Color bgNeutralLight100 = AppColors.neutral100;
  static const Color bgNeutralLight200 = AppColors.neutral200;

  // Shades
  static const Color bgShadesWhite = AppColors.shadesWhite;
  static const Color bgShadesBlack = AppColors.shadesBlack;

  // Icon Colors
  // Brand
  static const Color iconBrandPrimary = AppColors.brand800;
  static const Color iconBrandHover = AppColors.brand700;
  static const Color iconBrandPressed = AppColors.brand400;
  static const Color iconBrandDisabled = AppColors.brand300;

  // Yellow (Warning)
  static const Color iconWarningDefault = AppColors.yellowWarning900;
  static const Color iconWarningHover = AppColors.yellowWarning500;
  static const Color iconWarningPressed = AppColors.yellowWarning400;
  static const Color iconWarningDisabled = AppColors.yellowWarning300;

  // Red (Error)
  static const Color iconErrorDefault = AppColors.redError900;
  static const Color iconErrorHover = AppColors.redError500;
  static const Color iconErrorPressed = AppColors.redError400;
  static const Color iconErrorDisabled = AppColors.redError300;

  // Green (Success)
  static const Color iconSuccessDefault = AppColors.greenSuccess900;
  static const Color iconSuccessHover = AppColors.greenSuccess500;
  static const Color iconSuccessPressed = AppColors.greenSuccess400;
  static const Color iconSuccessDisabled = AppColors.greenSuccess300;

  // Neutral
  static const Color iconNeutralDefault = AppColors.neutral900;
  static const Color iconNeutralHover = AppColors.neutral500;
  static const Color iconNeutralPressed = AppColors.neutral400;
  static const Color iconNeutralDisabled = AppColors.neutral300;

  // Stroke Colors
  // Brand
  static const Color strokeBrandDefault = AppColors.brand700;
  static const Color strokeBrandHover = AppColors.brand600;
  static const Color strokeBrandPressed = AppColors.brand800;
  static const Color strokeBrandDisabled = AppColors.brand300;

  // Yellow (Warning)
  static const Color strokeWarningDefault = AppColors.yellowWarning600;
  static const Color strokeWarningHover = AppColors.yellowWarning500;
  static const Color strokeWarningPressed = AppColors.yellowWarning700;
  static const Color strokeWarningDisabled = AppColors.yellowWarning300;

  // Red (Error)
  static const Color strokeErrorDefault = AppColors.redError600;
  static const Color strokeErrorHover = AppColors.redError500;
  static const Color strokeErrorPressed = AppColors.redError700;
  static const Color strokeErrorDisabled = AppColors.redError300;

  // Green (Success)
  static const Color strokeSuccessDefault = AppColors.greenSuccess600;
  static const Color strokeSuccessHover = AppColors.greenSuccess500;
  static const Color strokeSuccessPressed = AppColors.greenSuccess700;
  static const Color strokeSuccessDisabled = AppColors.greenSuccess300;

  // Neutral
  static const Color strokeNeutralDefault = AppColors.neutral600;
  static const Color strokeNeutralHover = AppColors.neutral500;
  static const Color strokeNeutralPressed = AppColors.neutral700;
  static const Color strokeNeutralDisabled = AppColors.neutral400;
  static const Color strokeNeutralLight50 = AppColors.neutral50;
  static const Color strokeNeutralLight100 = AppColors.neutral100;
  static const Color strokeNeutralLight200 = AppColors.neutral200;

  // Shades
  static const Color strokeShadesWhite = AppColors.white;
  static const Color strokeShadesBlack = AppColors.black;
}
