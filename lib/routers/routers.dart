import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qqmusic/const/const.dart';
import 'package:qqmusic/pages/LikePage/LikePage.dart';
import 'package:qqmusic/pages/MusicHallPage/MusicHallPage.dart';
import 'package:qqmusic/pages/RecommendPage/RecommendPage.dart';
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
          path: '/recommend',
          name: ROUTER_NAME.recommend.name,
          builder: (BuildContext context, GoRouterState state) {
            return RecommendPage();
          },
        ),
        GoRoute(
          path: '/musichall',
          name: ROUTER_NAME.musichall.name,
          builder: (context, state) {
            return MusicHallPage();
          },
        ),
        GoRoute(
          path: '/like',
          name: ROUTER_NAME.like.name,
          builder: (context, state) {
            return LikePage();
          },
        ),
      ],
    ),
  ],
);
