import 'package:flutter/material.dart';

extension ScrollControllerExt on ScrollController {
  void animateToMaxScrollExtent({int miliseconds = 500}) {
    animateTo(
      position.maxScrollExtent,
      duration: Duration(milliseconds: miliseconds),
      curve: Curves.linear,
    );
  }
}
