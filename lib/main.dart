import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart'
    show GoRoute, GoRouter, GoRouterState, RouteBase, ShellRoute;
import 'package:qqmusic/api/user/song_list.dart';
import 'package:qqmusic/api/user/user.dart';
import 'package:qqmusic/bloc/user_bloc.dart' show UserBloc;
import 'package:qqmusic/components/transition_resolver.dart'
    show transitionResolver;
import 'package:qqmusic/const/const.dart' show ROUTER_NAME;
import 'package:qqmusic/model/cookie.dart';
import 'package:qqmusic/pages/home.dart' show HomePage;
import 'package:qqmusic/pages/like/like_page.dart' show LikePage;
import 'package:qqmusic/pages/local_download/local_download_page.dart'
    show LocalDownloadPage;
import 'package:qqmusic/pages/music_hall/music_hall_page.dart'
    show MusicHallPage;
import 'package:qqmusic/pages/personal_homepage/personal_homepage.dart'
    show PersonalHomepage;
import 'package:qqmusic/pages/purchased/purchased_page.dart' show PurchasedPage;
import 'package:qqmusic/pages/recently/recently_page.dart' show RecentlyPage;
import 'package:qqmusic/pages/recommend/recommend_page.dart' show RecommendPage;
import 'package:qqmusic/pages/trial_listening/trial_listening_page.dart'
    show TrialListeningPage;
import 'package:qqmusic/theme/theme.dart' show GlobalThemData;
import 'package:qqmusic/tools/logger.dart' show Logger;
import 'package:qqmusic/tools/path.dart';
import 'package:window_manager/window_manager.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'shell',
);

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
  await QCookie().init();

  UserApi().init();
  SongListApi().init();

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

class MyApp extends StatefulWidget {
  // 页面路由
  late final GoRouter _router;
  // Bloc
  late final UserBloc userBloc;

  MyApp({super.key}) {
    userBloc = UserBloc();
    _router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/PersonalHomepage',
      routes: <RouteBase>[
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (BuildContext context, GoRouterState state, Widget child) {
            return MultiBlocProvider(
              providers: [BlocProvider.value(value: userBloc)],
              child: HomePage(child: child),
            );
          },
          // builder: (context, state, child) {
          //   return HomePage(child: child);
          // },
          routes: <RouteBase>[
            // 推荐
            GoRoute(
              path: '/${ROUTER_NAME.recommend.name}',
              name: ROUTER_NAME.recommend.name,
              pageBuilder: (BuildContext context, GoRouterState state) {
                return transitionResolver(RecommendPage());
              },
            ),
            // 乐馆
            GoRoute(
              path: '/${ROUTER_NAME.musichall.name}',
              name: ROUTER_NAME.musichall.name,
              pageBuilder: (context, state) {
                return transitionResolver(MusicHallPage());
              },
            ),
            // 喜欢
            GoRoute(
              path: '/${ROUTER_NAME.like.name}',
              name: ROUTER_NAME.like.name,
              pageBuilder: (context, state) {
                return transitionResolver(LikePage());
              },
            ),
            // 最近播放
            GoRoute(
              path: '/${ROUTER_NAME.recently.name}',
              name: ROUTER_NAME.recently.name,
              pageBuilder: (context, state) {
                return transitionResolver(RecentlyPage());
              },
            ),
            // 本地和下载
            GoRoute(
              path: '/${ROUTER_NAME.localdownload.name}',
              name: ROUTER_NAME.localdownload.name,
              pageBuilder: (context, state) {
                return transitionResolver(LocalDownloadPage());
              },
            ),
            // 已购音乐
            GoRoute(
              path: '/${ROUTER_NAME.purchased.name}',
              name: ROUTER_NAME.purchased.name,
              pageBuilder: (context, state) {
                return transitionResolver(PurchasedPage());
              },
            ),
            // 试听列表
            GoRoute(
              path: '/${ROUTER_NAME.triallistening.name}',
              name: ROUTER_NAME.triallistening.name,
              pageBuilder: (context, state) {
                return transitionResolver(TrialListeningPage());
              },
            ),
            // 个人主页
            GoRoute(
              path: '/${ROUTER_NAME.personalhomepage.name}',
              name: ROUTER_NAME.personalhomepage.name,
              // pageBuilder:
              //     (context, state) => transitionResolver(
              //       MultiBlocProvider(
              //         providers: [BlocProvider.value(value: userBloc)],
              //         child: PersonalHomepage(),
              //       ),
              //     ),
              pageBuilder: (context, state) {
                return transitionResolver(PersonalHomepage());
              },
            ),
          ],
        ),
      ],
    );
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'QQ Music Demo',
      debugShowCheckedModeBanner: false,
      // theme: GlobalThemData.lightThemeData,
      theme: createLightThemeData(),
      routerConfig: widget._router,
    );
  }
}

ThemeData createLightThemeData() {
  return ThemeData.light(
    useMaterial3: true,
  ).copyWith(textTheme: ThemeData(fontFamily: 'MSYH').textTheme);
}
