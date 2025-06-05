import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qqmusic/components/transition_resolver.dart';
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
          pageBuilder: (BuildContext context, GoRouterState state) {
            return transitionResolver(RecommendPage());
          },
        ),
        GoRoute(
          path: '/${ROUTER_NAME.musichall.name}',
          name: ROUTER_NAME.musichall.name,
          pageBuilder: (context, state) {
            return transitionResolver(MusicHallPage());
          },
        ),
        GoRoute(
          path: '/${ROUTER_NAME.like.name}',
          name: ROUTER_NAME.like.name,
          pageBuilder: (context, state) {
            return transitionResolver(LikePage());
          },
        ),
        GoRoute(
          path: '/${ROUTER_NAME.recently.name}',
          name: ROUTER_NAME.recently.name,
          pageBuilder: (context, state) {
            return transitionResolver(RecentlyPage());
          },
        ),
        GoRoute(
          path: '/${ROUTER_NAME.localdownload.name}',
          name: ROUTER_NAME.localdownload.name,
          pageBuilder: (context, state) {
            return transitionResolver(LocalDownloadPage());
          },
        ),
        GoRoute(
          path: '/${ROUTER_NAME.purchased.name}',
          name: ROUTER_NAME.purchased.name,
          pageBuilder: (context, state) {
            return transitionResolver(PurchasedPage());
          },
        ),
        GoRoute(
          path: '/${ROUTER_NAME.triallistening.name}',
          name: ROUTER_NAME.triallistening.name,
          pageBuilder: (context, state) {
            return transitionResolver(TrialListeningPage());
          },
        ),
      ],
    ),
  ],
);
