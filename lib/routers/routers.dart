import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qqmusic/const/const.dart';
import 'package:qqmusic/pages/like/like_page.dart';
import 'package:qqmusic/pages/local_download/local_download_page.dart';
import 'package:qqmusic/pages/music_hall/music_hall_page.dart';
import 'package:qqmusic/pages/purchased/purchased_page.dart';
import 'package:qqmusic/pages/recently/recently_page.dart';
import 'package:qqmusic/pages/recommend/recommend_page.dart';
import 'package:qqmusic/pages/trial_listening/trial_listening_page.dart';
import 'package:qqmusic/pages/home.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'shell',
);

final GoRouter routers = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/recommend',
  routes: <RouteBase>[
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return HomePage(child: child);
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/${ROUTER_NAME.recommend.name}',
          name: ROUTER_NAME.recommend.name,
          builder: (BuildContext context, GoRouterState state) {
            return RecommendPage();
          },
        ),
        GoRoute(
          path: '/${ROUTER_NAME.musichall.name}',
          name: ROUTER_NAME.musichall.name,
          builder: (context, state) {
            return MusicHallPage();
          },
        ),
        GoRoute(
          path: '/${ROUTER_NAME.like.name}',
          name: ROUTER_NAME.like.name,
          builder: (context, state) {
            return LikePage();
          },
        ),
        GoRoute(
          path: '/${ROUTER_NAME.recently.name}',
          name: ROUTER_NAME.recently.name,
          builder: (context, state) {
            return RecentlyPage();
          },
        ),
        GoRoute(
          path: '/${ROUTER_NAME.localdownload.name}',
          name: ROUTER_NAME.localdownload.name,
          builder: (context, state) {
            return LocalDownloadPage();
          },
        ),
        GoRoute(
          path: '/${ROUTER_NAME.purchased.name}',
          name: ROUTER_NAME.purchased.name,
          builder: (context, state) {
            return PurchasedPage();
          },
        ),
        GoRoute(
          path: '/${ROUTER_NAME.triallistening.name}',
          name: ROUTER_NAME.triallistening.name,
          builder: (context, state) {
            return TrialListeningPage();
          },
        ),
      ],
    ),
  ],
);
