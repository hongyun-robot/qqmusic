import 'dart:io' show Directory, Platform;
import 'package:path_provider/path_provider.dart';
import 'package:qqmusic/tools/constant.dart' show homePathDirName;
import 'package:qqmusic/tools/logger.dart' show Logger;
import 'package:qqmusic/tools/platform.dart' show PlatformTool;
import 'package:intl/intl.dart';

class PathHelper {
  /// 单例
  static final PathHelper _instance = PathHelper._internal();
  PathHelper._internal();

  factory PathHelper() {
    return _instance;
  }
  late final String cachePath;
  late final String documentsPath;
  late final String supportPath;

  init() async {
    try {
      cachePath = (await getApplicationCacheDirectory()).path.replaceAll(
        '\\',
        '/',
      );
    } catch (e) {
      cachePath = '';
    }

    try {
      documentsPath = (await getApplicationDocumentsDirectory()).path
          .replaceAll('\\', '/');
    } catch (e) {
      documentsPath = '';
    }

    try {
      supportPath = (await getApplicationSupportDirectory()).path.replaceAll(
        '\\',
        '/',
      );
    } catch (e) {
      supportPath = '';
    }

    try {
      Directory(getHomePath).create(recursive: true);
    } catch (e) {
      Logger.instance.e('Create $getHomePath directory failed: $e');
    }
  }

  String get getHomePath {
    if (PlatformTool.isMacOS() || PlatformTool.isLinux()) {
      return '${Platform.environment['HOME'] ?? ''}/$homePathDirName'
          .replaceAll('\\', '/');
    } else if (PlatformTool.isWindows()) {
      return '${Platform.environment['UserProfile'] ?? ''}/$homePathDirName'
          .replaceAll('\\', '/');
    } else if (PlatformTool.isAndroid() || PlatformTool.isIOS()) {
      return '$documentsPath/$homePathDirName'.replaceAll('\\', '/');
    }

    return homePathDirName;
  }

  String get getLogFilePath {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    return '$getHomePath/$formattedDate-qqmusic-demo.log';
  }

  String get getCachePath {
    return getHomePath;
  }

  Map<String, String> toMap() {
    return {
      'cachePath': cachePath,
      'cachePathReal': getCachePath,
      'documentsPath': documentsPath,
      'supportPath': supportPath,
      'homePath': getHomePath,
      'logfilePath': getLogFilePath,
    };
  }
}
