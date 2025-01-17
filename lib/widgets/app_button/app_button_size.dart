part of 'app_button.dart';

enum AppButtonSize {
  xs,
  s,
  m,
  l,
  xl,
}

extension AppButtonSizeExtension on AppButtonSize {
  double get height {
    switch (this) {
      case AppButtonSize.xs:
        return 30;
      case AppButtonSize.s:
        return 36;
      case AppButtonSize.m:
        return 40;
      case AppButtonSize.l:
        return 46;
      case AppButtonSize.xl:
        return 52;
    }
  }

  TextStyle get textStyle {
    switch (this) {
      case AppButtonSize.xs:
        return AppTextStyles.p4Medium;
      case AppButtonSize.s:
        return AppTextStyles.p3Medium;
      case AppButtonSize.m:
        return AppTextStyles.p3Medium;
      case AppButtonSize.l:
        return AppTextStyles.p3Bold;
      case AppButtonSize.xl:
        return AppTextStyles.p2Medium;
    }
  }

  EdgeInsets get padding {
    switch (this) {
      case AppButtonSize.xs:
        return const EdgeInsets.symmetric(
          horizontal: 14, // figma 6
          // vertical: 8,
        );
      case AppButtonSize.s:
        return const EdgeInsets.symmetric(
          horizontal: 18, // figma 14
          // vertical: 10,
        );
      case AppButtonSize.m:
        return const EdgeInsets.symmetric(
          horizontal: 20,
          // vertical: 12,
        );
      case AppButtonSize.l:
        return const EdgeInsets.symmetric(
          horizontal: 22,
          // vertical: 14,
        );
      case AppButtonSize.xl:
        return const EdgeInsets.symmetric(
          horizontal: 24,
          // vertical: 16,
        );
    }
  }

  double get gap {
    switch (this) {
      case AppButtonSize.xs:
        return 6;
      case AppButtonSize.s:
        return 8;
      case AppButtonSize.m:
        return 10;
      case AppButtonSize.l:
        return 10;
      case AppButtonSize.xl:
        return 10;
    }
  }

  double get iconSize {
    switch (this) {
      case AppButtonSize.xs:
        return IconSize.medium;
      case AppButtonSize.s:
        return IconSize.medium;
      case AppButtonSize.m:
        return IconSize.medium;
      case AppButtonSize.l:
        return IconSize.large;
      case AppButtonSize.xl:
        return IconSize.xl;
    }
  }
}
