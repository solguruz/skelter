import 'package:flutter/material.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';

extension ShowSnackbar on BuildContext {
  void showSnackBar(
    String message, {
    Color? color,
    bool isDisplayingError = false,
    int millis = 3000,
    Widget? leading,
    Widget? trailing,
    SnackBarAction? action,
    Duration? duration,
    bool showTrailingLoader = false,
  }) {
    hideSnackBar();
    final Text messageText = Text(
      message,
      style: const TextStyle(color: Colors.white),
    );
    List<Widget> contents;

    if (trailing != null) {
      contents = <Widget>[
        Expanded(child: messageText),
        const SizedBox(width: 10),
        trailing,
      ];
    } else if (leading != null) {
      contents = <Widget>[
        leading,
        const SizedBox(width: 10),
        Expanded(child: messageText),
      ];
    } else if (showTrailingLoader) {
      contents = <Widget>[
        Expanded(child: messageText),
        const SizedBox(width: 10),
        const SizedBox.square(
          dimension: 20,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: 2,
          ),
        ),
      ];
    } else {
      contents = <Widget>[Expanded(child: messageText)];
    }
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: color ??
            (isDisplayingError
                ? AppColors.snackBarErrorColor
                : AppColors.snackBarBGColor),
        content: Row(children: contents),
        duration: duration ?? Duration(milliseconds: millis),
        behavior: SnackBarBehavior.floating,
        action: action,
      ),
    );
  }

  void hideSnackBar() {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
  }
}
