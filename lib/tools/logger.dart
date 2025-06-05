import 'dart:io';

import 'package:logger/logger.dart' as logger;
import 'package:qqmusic/tools/path.dart' show PathHelper;
import 'package:qqmusic/tools/platform.dart' show PlatformTool;

class Logger {
  static final logger.Logger instance = logger.Logger(
    printer: logger.PrettyPrinter(
      lineLength: 120,
      printTime: true,
      colors: false,
      noBoxingByDefault: true,
    ),
    output: logger.MultiOutput([
      logger.ConsoleOutput(),
      if (!PlatformTool.isWeb())
        logger.FileOutput(file: File(PathHelper().getLogfilePath)),
    ]),
  );
}
