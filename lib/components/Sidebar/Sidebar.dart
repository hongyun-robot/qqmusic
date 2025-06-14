import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qqmusic/bloc/user_bloc.dart';
import 'package:qqmusic/components/sidebar/components/profile.dart';
import 'package:qqmusic/components/sidebar/components/song_list.dart';
import 'package:qqmusic/components/sidebar/components/text_icon.dart';
import 'package:qqmusic/components/sidebar/components/text_icon2.dart';
import 'package:qqmusic/const/const.dart';
import 'package:qqmusic/routers/navigator_observer.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Padding(
        padding: const EdgeInsets.only(right: 11.0),
        child: Column(
          children: [
            // BlocProvider(create: (context) => UserBloc(), child: Profile()),
            Profile(),
            SizedBox(height: 67),
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
                SizedBox(height: 25),
              ],
            ),
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserLoginState) {
                  if (state.isLogin) {
                    return SongList();
                  }
                }
                return SizedBox();
              },
              buildWhen: (previous, current) => current is UserLoginState,
            ),
          ],
        ),
      ),
    );
  }
}
