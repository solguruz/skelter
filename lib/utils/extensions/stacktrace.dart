extension StackTraceExtensions on StackTrace {
  String upsertEventNameInfo(
    String gqlOperationName,
  ) {
    final output = toString().replaceAll(
      'MainBlocExtFirebaseAnalytics.logFirebaseEvent',
      'LogGQLIsolateState.$gqlOperationName,',
    );
    return output;
  }
}
