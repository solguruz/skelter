import 'package:flutter/material.dart';
import 'package:flutter_skeleton/gen/fonts.gen.dart';

class AppTextStyles {
  static TextStyle h1 = const TextStyle(
    fontSize: 29,
    fontWeight: FontWeight.w900,
    fontFamily: FontFamily.inter,
    height: 1.5,
    letterSpacing: -0.28,
  );

  static TextStyle h2 = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    fontFamily: FontFamily.inter,
    height: 1.5,
    letterSpacing: -0.24,
  );

  static TextStyle h2Bold = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontFamily: FontFamily.inter,
    height: 1.5,
    letterSpacing: -0.24,
  );

  static TextStyle h3 = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w900,
    fontFamily: FontFamily.inter,
    height: 1.5,
    letterSpacing: -0.24,
  );

  static TextStyle h3Medium = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.inter,
    height: 1.5,
    letterSpacing: -0.24,
  );

  static TextStyle h6Medium = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.inter,
    height: 1.5,
    letterSpacing: -1,
  );
  static TextStyle h6Bold = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontFamily: FontFamily.inter,
    height: 1.5,
    letterSpacing: -1,
  );

  static TextStyle h4SemiBold = const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    fontFamily: FontFamily.inter,
    height: 36 / 28,
    letterSpacing: -0.28,
  );

  static TextStyle h6SemiBold = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: FontFamily.inter,
    height: 1.5,
    letterSpacing: -1,
  );

  static TextStyle p3Regular = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: FontFamily.inter,
    height: 1.5,
  );

  static TextStyle p1Medium = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.inter,
    height: 1.5,
  );

  static TextStyle p1SemiBold = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontFamily: FontFamily.inter,
    height: 1.5,
  );

  static TextStyle p2Medium = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.inter,
    height: 1.5,
  );

  static TextStyle p2Regular = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: FontFamily.inter,
    height: 1.5,
  );

  static TextStyle p3Medium = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.inter,
    height: 1.5,
  );

  static TextStyle p3SemiBold = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: FontFamily.inter,
    height: 1.5,
  );

  static TextStyle p4Medium = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.inter,
    height: 1.5,
  );

  static TextStyle p4Regular = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: FontFamily.inter,
    height: 1.5,
  );

  static TextStyle p1Bold = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: FontFamily.inter,
    height: 1.5,
  );

  static TextStyle p2Bold = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: FontFamily.inter,
    height: 1.5,
  );

  static TextStyle p2SemiBold = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: FontFamily.inter,
    height: 1.5,
  );

  static TextStyle p3Bold = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    fontFamily: FontFamily.inter,
    height: 1.5,
  );
  static TextStyle p4SemiBold = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    fontFamily: FontFamily.inter,
    height: 1.5,
  );

  static TextStyle p4Bold = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    fontFamily: FontFamily.inter,
    height: 1.5,
  );

  static TextStyle c1SemiBold = const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    fontFamily: FontFamily.inter,
    height: 1.4,
  );

  static TextStyle c2Regular = const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    fontFamily: FontFamily.inter,
    height: 1.5,
  );

  static TextStyle c2Medium = const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.inter,
    height: 1.5,
  );

  static TextStyle c2SemiBold = const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    fontFamily: FontFamily.inter,
    height: 1.5,
  );
}

extension AppTextStyleExtension on TextStyle {
  TextStyle withColor(Color color) => copyWith(color: color);

  TextStyle withDecoration(TextDecoration decoration) =>
      copyWith(decoration: decoration);
}
