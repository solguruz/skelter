import 'package:flutter/widgets.dart';

extension MediaQueryHeightExcludingVerticalPadding on MediaQueryData {
  double? heightExcludingVerticalPadding() =>
      size.height - padding.top - padding.bottom;
}
