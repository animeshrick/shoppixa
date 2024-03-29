import 'package:flutter/material.dart';

class LoggerExtension {
  static AppLog logger = AppLog();
}

/// A Logger For Flutter Apps
/// Usage:
/// 1) AppLog.i("Info Message");
/// 2) AppLog.i("Home Page", tag: "User Logging");
///
class AppLog {
  static const String _DEFAULT_TAG_PREFIX = "AppLog";

  ///use Log.v. Print all Logs
  static const int VERBOSE = 2;

  ///use Log.d. Print Debug Logs
  static const int DEBUG = 3;

  ///use Log.i. Print Info Logs
  static const int INFO = 4;

  ///use Log.w. Print warning logs
  static const int WARN = 5;

  ///use Log.e. Print error logs
  static const int ERROR = 6;

  ///use Log.wtf. Print Failure Logs(What a Terrible Failure= WTF)
  static const int Failed = 7;

  ///SET APP LOG LEVEL, Default ALL
  static int _currentLogLevel = VERBOSE;

  static setLogLevel(int priority) {
    int newPriority = priority;
    if (newPriority <= VERBOSE) {
      newPriority = VERBOSE;
    } else if (newPriority >= Failed) {
      newPriority = Failed;
    }
    _currentLogLevel = newPriority;
  }

  static _log(int priority, String tag, String message,
      {Object? error, StackTrace? stackTrace, DateTime? time}) {
    if (_currentLogLevel <= priority) {
      debugPrint(
          ascieEscape(priority,
              text: "${_getPriorityText(priority)}$tag::==>  $message"),
          wrapWidth: 1024);
      if (error != null) {
        debugPrint(ascieEscape(priority, text: error.toString()));
      }

      if (stackTrace != null) {
        debugPrint(ascieEscape(priority, text: stackTrace.toString()));
      }
      if (time != null) {
        debugPrint(ascieEscape(priority, text: time.toString()));
      }
    }
  }

  static String _getPriorityText(int priority) {
    switch (priority) {
      case INFO:
        return "💡 INFO | ";
      case DEBUG:
        return "🛠️ DEBUG | ";
      case ERROR:
        return "⛔ ERROR | ";
      case WARN:
        return "🚧 WARN | ";
      case Failed:
        return "🚫 Failed | ";
      case VERBOSE:
      default:
        return "✏️";
    }
  }

  static String ascieEscape(int priority, {String? text}) {
    switch (priority) {
      case INFO:
        return "\x1B[32m$text\x1B[0m";
      case DEBUG:
        return "\x1B[34m$text\x1B[0m";
      case ERROR:
        return "\x1B[31m$text\x1B[0m";
      case WARN:
        return "\x1B[33m$text\x1B[0m";
      case Failed:
        return "\x1B[35m$text\x1B[0m";
      case VERBOSE:
      default:
        return "\x1B[37m$text\x1B[0m";
    }
  }

  ///Print general logs
  static v(var message, {String tag = _DEFAULT_TAG_PREFIX, DateTime? time}) {
    _log(VERBOSE, tag, message, time: time);
  }

  ///Print info logs
  static i(var message, {String tag = _DEFAULT_TAG_PREFIX, DateTime? time}) {
    _log(INFO, tag, message.toString(), time: time);
  }

  ///Print debug logs
  static d(var message, {String tag = _DEFAULT_TAG_PREFIX, DateTime? time}) {
    _log(DEBUG, tag, message, time: time);
  }

  ///Print warning logs
  static w(var message, {String tag = _DEFAULT_TAG_PREFIX, DateTime? time}) {
    _log(WARN, tag, message, time: time);
  }

  ///Print error logs
  static e(var message,
      {String tag = _DEFAULT_TAG_PREFIX,
      Object? error,
      StackTrace? stackTrace,
      DateTime? time}) {
    _log(ERROR, tag, message.toString(),
        error: error, stackTrace: stackTrace, time: time);
  }

  ///Print failure logs
  static t(String message, {String tag = _DEFAULT_TAG_PREFIX}) {
    _log(Failed, tag, message);
  }
}
