import 'package:flutter/widgets.dart';

class AnalyticsHelper {
  static AnalyticsHelper? _instance = AnalyticsHelper._internal();

  factory AnalyticsHelper() {
    return _instance ??= AnalyticsHelper._internal();
  }

  AnalyticsHelper._internal();

  // MainBloc? _mainBloc;

  void init(BuildContext context) {
    // _mainBloc = Common().mainBloc(context);
  }

  void dispose() {
    _instance = null;
  }

  void logCustomEvent(
    String eventName, {
    Map<String, String>? parameters,
  }) {
    // if (_mainBloc == null) {
    //   throw Exception(
    //     'AnalyticsHelper not initialized. Call init() before using',
    //   );
    // }
    debugPrint('logCustomEvent: $eventName, parameters: $parameters');
    // _mainBloc?.logCustomEvent(eventName, parameters);
  }

  void setTestingInstance(AnalyticsHelper newInstance) {
    _instance = newInstance;
  }
}
