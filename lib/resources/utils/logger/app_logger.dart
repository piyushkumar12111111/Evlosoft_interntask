import 'package:logger/logger.dart';
import 'dart:io';

class AppLogger {
  final logger = Logger(
    printer: PrettyPrinter(),
  );

  AppLogger() {
    // Set the log level to info (default is Level.debug)
  }

  void logInfo(String message) {
    logger.i('INFO: $message');
  }

  void logWarning(String message) {
    logger.w('WARNING: $message');
  }

  void logError(String message, dynamic error) {
    logger.e('ERROR: $message', error: error);
  }

  void logCustom(String level, String message) {
    switch (level.toLowerCase()) {
      case 'debug':
        logger.d('DEBUG: $message');
        break;
      case 'verbose':
        logger.v('VERBOSE: $message');
        break;
      default:
        logger.i('CUSTOM: $message');
    }
  }

  // Future<void> logToFile(String message) async {
  //   final appDirectory = await getApplicationDocumentsDirectory();
  //   final logFile = File('${appDirectory.path}/app_log.txt');
  //   await logFile.writeAsString('$message\n', mode: FileMode.append);
  // }
}

// void main() {
//   final logger = AppLogger();
//
//   logger.logInfo('This is an information log message.');
//   logger.logWarning('This is a warning log message.');
//   logger.logError('This is an error log message.', Exception('Some error occurred.'));
//   logger.logCustom('debug', 'This is a custom debug log message.');
//   logger.logCustom('verbose', 'This is a custom verbose log message.');
//
//  // logger.logToFile('This log message will be saved to a file.');
//
//   // You can configure and use the logger as needed throughout your app.
// }
