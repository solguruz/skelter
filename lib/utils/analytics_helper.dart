import 'package:flutter/widgets.dart';

class AnalyticsHelper {
  static AnalyticsHelper? _instance = AnalyticsHelper._internal();

  factory AnalyticsHelper() {
    return _instance ??= AnalyticsHelper._internal();
  }

  AnalyticsHelper._internal();

  void init(BuildContext context) {}

  void dispose() {
    _instance = null;
  }

  void logCustomEvent(
    String eventName, {
    Map<String, String>? parameters,
  }) {
    // TODO: add to analytics
    debugPrint('logCustomEvent: $eventName, parameters: $parameters');
  }

  void setTestingInstance(AnalyticsHelper newInstance) {
    _instance = newInstance;
  }
}
