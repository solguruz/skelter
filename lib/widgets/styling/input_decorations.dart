import 'package:flutter/material.dart';

class InputDecorations {
  static TextStyle labelStyleBright = const TextStyle(
    fontSize: 17.0,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static TextStyle hintStyleBright = const TextStyle(
    fontSize: 17.0,
  );

  static TextStyle labelStyleDark = const TextStyle(
    fontSize: 17.0,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle hintStyleDark = const TextStyle(
    color: Colors.white,
    fontSize: 17.0,
  );

  static TextStyle errorStyle = const TextStyle(color: Colors.redAccent);

  static InputDecoration denseDecoration(
    String labelText, {
    required BuildContext context,
    String? errorText,
    Widget? suffix,
    Widget? suffixIcon,
  }) {
    if (Theme.of(context).brightness == Brightness.light) {
      return denseDecorationBright(
        labelText: labelText,
        errorText: errorText,
        suffix: suffix,
        suffixIcon: suffixIcon,
      );
    } else {
      return denseDecorationDark(
        labelText: labelText,
        errorText: errorText,
        suffix: suffix,
        suffixIcon: suffixIcon,
      );
    }
  }

  static InputDecoration denseDecorationBright({
    String? labelText,
    String? errorText,
    Widget? suffix,
    Widget? suffixIcon,
  }) =>
      InputDecoration(
        labelText: labelText,
        suffixIcon: suffixIcon,
        suffix: suffix,
        errorText: errorText?.isEmpty ?? false ? null : errorText,
        isDense: true,
        hintStyle: hintStyleBright,
        labelStyle: labelStyleBright,
        helperStyle: hintStyleBright,
      );

  static InputDecoration denseDecorationDark({
    String? labelText,
    String? errorText,
    Widget? suffix,
    Widget? suffixIcon,
  }) =>
      InputDecoration(
        labelText: labelText,
        errorStyle: errorStyle,
        suffix: suffix,
        suffixIcon: suffixIcon,
        errorText: errorText?.isEmpty ?? false ? null : errorText,
        isDense: true,
        hintStyle: hintStyleDark,
        labelStyle: labelStyleDark,
        helperStyle: hintStyleDark,
      );
}
