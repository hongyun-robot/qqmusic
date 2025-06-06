import 'package:flutter/material.dart';
import 'package:qqmusic/api/user/user.dart';
import 'package:qqmusic/routers/routers.dart';
import 'package:qqmusic/theme/theme.dart' show GlobalThemData;
import 'package:qqmusic/tools/logger.dart' show Logger;
import 'package:qqmusic/tools/path.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = WindowOptions(
    size: Size(1212, 786),
    minimumSize: Size(1035, 786),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  await PathHelper().init();

  await UserApi().init();

  FlutterError.onError = (FlutterErrorDetails details) {
    if (details.library == 'rendering library' ||
        details.library == 'image resource service') {
      return;
    }

    Logger.instance.e(
      details.summary,
      error: details.exception,
      stackTrace: details.stack,
    );
    Logger.instance.d(details.stack);
  };

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'QQ Music Demo',
      routerConfig: routers,
      theme: GlobalThemData.lightThemeData,
    );
  }
}
