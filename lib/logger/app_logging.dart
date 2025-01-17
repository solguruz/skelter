import 'dart:core';
import 'dart:io';

import 'package:flutter_skeleton/constants/constants.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class _LogMessage {
  final String className;
  final String logMessage;

  _LogMessage(this.className, this.logMessage);
}

/// App-specific formatting of log lines.
///
/// Example log line:
///
/// D/FeedPage (2024-06-03T19:42:01.115371Z): setting posts
///
class _AppLogPrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    // Returns UTC time.
    final String time = event.time.toUtc().toIso8601String();
    final String level = _getLevel(event.level);
    final _LogMessage logMessage = event.message as _LogMessage;
    final String className = logMessage.className;
    final String message = logMessage.logMessage;

    return <String>['$level/$className ($time): $message'];
  }

  String _getLevel(Level level) {
    switch (level) {
      case Level.debug:
        return 'D';
      case Level.info:
        return 'I';
      case Level.warning:
        return 'W';
      case Level.error:
        return 'E';
      case Level.fatal:
        return 'F';
      default:
        return '';
    }
  }
}

/// Outputs the logs to a log file in the App's application
/// directory/app.log.
class AppFileOutput extends LogOutput {
  // Open file descriptor to log file.
  static File? _file;

  static final AppFileOutput _instance = AppFileOutput._();

  factory AppFileOutput() => _instance;

  AppFileOutput._();

  // Initializes the log file, should only be called once.
  Future<void> initializeLogFile() async {
    assert(_file == null, 'Should not call this method more than once');
    final Directory appDocumentsDirectory =
        await getApplicationDocumentsDirectory();
    _file = File('${appDocumentsDirectory.path}/$kLogFileName');
  }

  // Initializes the log file, should only be called once.
  void initializeLogFileFromPath(String path) {
    assert(
      _file == null,
      'initializeLogFileFromPath: '
      'Should not call this method more than once',
    );
    _file = File(path);
  }

  @override
  void output(OutputEvent event) async {
    // Protects against logging calls before the file is initialized.
    if (_file == null) {
      return;
    }

    final String lines =
        event.lines.map((String line) => '$line\n').toList().join();
    _file?.writeAsStringSync(lines, mode: FileMode.append);
  }
}

/// Name-space app's logging method, classes should implement [Loggable].
class _Logging {
  /// Returns an app-specific logger that writes to both console and file.
  static Logger getLogger() => Logger(
        filter: ProductionFilter(),
        printer: _AppLogPrinter(),
        output: MultiOutput(<LogOutput?>[
          ConsoleOutput(),
          AppFileOutput(),
        ]),
      );
}

/// Implement this class to enable logging via the app logger.
mixin Loggable {
  /// Name pre-pended to all logs.
  String get className;

  /// Ensure logger object is cached for the class.
  static final Logger _logger = _Logging.getLogger();

  /// Log-level: Debug
  void logD(String message) {
    _logger.d(_LogMessage(className, message));
  }

  /// Log-level: Info
  void logI(String message) {
    _logger.i(_LogMessage(className, message));
  }

  /// Log-level: Warn
  void logW(String message) {
    _logger.w(_LogMessage(className, message));
  }

  /// Log-level: Error
  void logE(String message) {
    _logger.e(_LogMessage(className, message));
  }

  /// Log-level: Fatal
  void logF(String message) {
    _logger.f(_LogMessage(className, message));
  }
}
