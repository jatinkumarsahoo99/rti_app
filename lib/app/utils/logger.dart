

import 'package:flutter_logs/flutter_logs.dart';

class Logger {
  //logs initialization
  static Future<void> initLogs() async {
    //Initialize Logging
    await FlutterLogs.initLogs(
        logLevelsEnabled: [LogLevel.INFO, LogLevel.WARNING, LogLevel.ERROR, LogLevel.SEVERE],
        timeStampFormat: TimeStampFormat.TIME_FORMAT_READABLE,
        directoryStructure: DirectoryStructure.FOR_DATE,
        logTypesEnabled: ["device", "network", "errors"],
        logFileExtension: LogFileExtension.LOG,
        logsWriteDirectoryName: "RTI User App",
        logsExportDirectoryName: "RTI/Exported",
        debugFileOperations: true,
        isDebuggable: true);
  }

  // method use to print the info log
  static setInfoLogs(String className, String methodName, String message) {
    FlutterLogs.logInfo(className, methodName, message);
  }

  //method use to print the warning logs
  static setWarnLogs(String className, String methodName, String message) {
    FlutterLogs.logWarn(className, methodName, message);
  }

//method use to print the error logs
  static setErrorLogs(String className, String methodName, String message) {
    FlutterLogs.logError(className, methodName, message);
  }

//method use to print the error tracing logs
  static setErrorTraceLogs(String className, String methodName, String message) {
    FlutterLogs.logErrorTrace(className, methodName, message, Error());
  }
}
