import 'dart:math';

const int MAX_ANALYTICS_STACKTRACE_LENGTH = 99;

String trimStackTrace(String e) =>
    e.substring(0, min(MAX_ANALYTICS_STACKTRACE_LENGTH, e.length));
