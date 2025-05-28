import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qqmusic/components/Sidebar/components/TextIcon.dart';
import 'package:qqmusic/components/Sidebar/components/TextIcon2.dart';
import 'package:qqmusic/const/const.dart';
import 'package:qqmusic/routers/navigator_observer.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({required this.constraints, super.key});

  final BoxConstraints constraints;

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                TextIcon(
                  icon: Icons.home_rounded,
                  routerItem: ROUTER_NAME.recommend,
                  onTap: () {
                    GoRouter.of(context).push('/${ROUTER_NAME.recommend.name}');
                    var state = GoRouter.of(context).state;
                    routeHistoryObserver.didPush(state);
                  },
                ),
                TextIcon(
                  icon: Icons.explore_rounded,
                  routerItem: ROUTER_NAME.musichall,
                  onTap: () {
                    GoRouter.of(context).pushNamed(ROUTER_NAME.musichall.name);
                    var state = GoRouter.of(context).state;
                    routeHistoryObserver.didPush(state);
                  },
                ),
              ],
            ),
            SizedBox(height: 8),
            Placeholder(fallbackHeight: 28, color: PRIMARY_COLOR),
            SizedBox(height: 25),
            Column(
              children: [
                TextIcon2(
                  icon: Icons.favorite_outline_rounded,
                  activeIcon: Icons.favorite_rounded,
                  routerItem: ROUTER_NAME.like,
                  onTap: () {
                    GoRouter.of(context).pushNamed(ROUTER_NAME.like.name);
                    var state = GoRouter.of(context).state;
                    routeHistoryObserver.didPush(state);
                  },
                ),
                TextIcon2(
                  icon: Icons.access_time_rounded,
                  activeIcon: Icons.access_time_filled_rounded,
                  routerItem: ROUTER_NAME.recently,
                  onTap: () {
                    GoRouter.of(context).pushNamed(ROUTER_NAME.recently.name);
                    var state = GoRouter.of(context).state;
                    routeHistoryObserver.didPush(state);
                  },
                ),
                TextIcon2(
                  icon: Icons.download_rounded,
                  routerItem: ROUTER_NAME.localdownload,
                  onTap: () {
                    GoRouter.of(
                      context,
                    ).pushNamed(ROUTER_NAME.localdownload.name);
                    var state = GoRouter.of(context).state;
                    routeHistoryObserver.didPush(state);
                  },
                ),
                TextIcon2(
                  icon: Icons.assignment_turned_in_outlined,
                  activeIcon: Icons.assignment_turned_in_rounded,
                  routerItem: ROUTER_NAME.purchased,
                  onTap: () {
                    GoRouter.of(context).pushNamed(ROUTER_NAME.purchased.name);
                    var state = GoRouter.of(context).state;
                    routeHistoryObserver.didPush(state);
                  },
                ),
                TextIcon2(
                  icon: Icons.queue_music_rounded,
                  routerItem: ROUTER_NAME.triallistening,
                  onTap: () {
                    GoRouter.of(
                      context,
                    ).pushNamed(ROUTER_NAME.triallistening.name);
                    var state = GoRouter.of(context).state;
                    routeHistoryObserver.didPush(state);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
