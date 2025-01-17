abstract class AnalyticsEvent {
  Map<String, dynamic>? getAnalyticParameters();

  final String eventName;

  AnalyticsEvent({required this.eventName});

  bool shouldLogEvent();
}
