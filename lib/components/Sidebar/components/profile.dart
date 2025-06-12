/*
 * @author: hongyun
 * @since: 2025-05-29
 * profile.dart
*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart' show GoRouter;
import 'package:qqmusic/bloc/user_bloc.dart';
import 'package:qqmusic/components/sidebar/components/login_dialog.dart';
import 'package:qqmusic/components/z_icon/z_icon.dart';
import 'package:qqmusic/const/const.dart' show ROUTER_NAME;
import 'package:qqmusic/const/icon-style.dart' show ICON_STYLE;
import 'package:qqmusic/routers/navigator_observer.dart'
    show routeHistoryObserver;

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late final UserBloc _userBloc;
  @override
  void initState() {
    super.initState();
    _userBloc = context.read<UserBloc>();
    _userBloc.add(UserLoadedEvent());
    // context.read<UserBloc>().add(UserLoadedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          height: 53,
          child: BlocBuilder<UserBloc, UserState>(
            buildWhen: (previous, current) => current is UserLoaded,
            builder: (context, state) {
              if (state is UserLoaded) {
                return GestureDetector(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(
                            context,
                          ).pushNamed(ROUTER_NAME.personalhomepage.name);
                          var state = GoRouter.of(context).state;
                          routeHistoryObserver.didPush(state);
                        },
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: Image.network(
                            state.userInfo.data!.creator.headpic,
                            width: 22,
                            height: 22,
                            // fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          state.userInfo.data!.creator.nick,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(wordSpacing: 0, fontSize: 13),
                        ),
                      ),
                      SizedBox(width: 10),
                      ...state.userInfo.data!.creator.userInfoUi.iconlist.map(
                        (i) => Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Image.network(
                            i.srcUrl,
                            // width: 22,
                            height: 17,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      ZIcon(
                        icon: Icons.expand_more_rounded,
                        color: ICON_STYLE.defaultColor,
                        hoverColor: ICON_STYLE.hoverColor,
                        size: 30,
                      ),
                    ],
                  ),
                );
              } else {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      barrierColor: Colors.transparent,
                      context: context,
                      builder:
                          (context) => BlocProvider.value(
                            // value: context.read<UserBloc>(),
                            value: _userBloc,
                            child: LoginDialog(),
                          ),
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/demo/profile.png',
                        width: 22,
                        height: 22,
                      ),
                      SizedBox(width: 8),
                      Text('点击登录123', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
    // return BlocBuilder<UserBloc, UserState>(
    //   buildWhen: (previous, current) => current is UserLoaded,
    //   builder: (context, state) {
    //     if (state is UserLoaded) {
    //       return MouseRegion(
    //         cursor: SystemMouseCursors.click,
    //         child: Align(
    //           alignment: Alignment.centerLeft,
    //           child: SizedBox(
    //             height: 53,
    //             child: Row(
    //               mainAxisSize: MainAxisSize.min,
    //               children: [
    //                 Image.network(
    //                   state.userInfo.data!.creator.headpic,
    //                   width: 22,
    //                   height: 22,
    //                   // fit: BoxFit.cover,
    //                 ),
    //                 SizedBox(width: 8),
    //                 Text(state.userInfo.data!.creator.nick),
    //               ],
    //             ),
    //           ),
    //         ),
    //       );
    //     } else {
    //       return GestureDetector(
    //         onTap: () {
    //           showDialog(
    //             barrierColor: Colors.transparent,
    //             context: context,
    //             builder: (context) => LoginDialog(),
    //             // (BuildContext context) => MultiBlocProvider(
    //             //   providers: [BlocProvider(create: (context) => UserBloc())],
    //             //   child: LoginDialog(),
    //             // ),
    //           );
    //         },
    //         child: MouseRegion(
    //           cursor: SystemMouseCursors.click,
    //           child: Align(
    //             alignment: Alignment.centerLeft,
    //             child: SizedBox(
    //               height: 53,
    //               child: Row(
    //                 mainAxisSize: MainAxisSize.min,
    //                 children: [
    //                   Image.asset(
    //                     'assets/images/demo/profile.png',
    //                     width: 22,
    //                     height: 22,
    //                   ),
    //                   SizedBox(width: 8),
    //                   Text('点击登录123', style: TextStyle(fontSize: 12)),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //       );
    //     }
    //   },
    // );
  }
}
