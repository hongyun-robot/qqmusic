/*
 * @author: hongyun
 * @since: 2025-05-29
 * profile.dart
*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qqmusic/bloc/user_bloc.dart';
import 'package:qqmusic/components/sidebar/components/login_dialog.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(UserLoadedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) {
        print('Previous state: $previous, Current state: $current');
        return current is UserLoaded;
      },
      builder: (context, state) {
        if (state is UserLoaded) {
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: 53,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(
                      state.userInfo.data!.creator.headpic,
                      width: 22,
                      height: 22,
                    ),
                    SizedBox(width: 8),
                    Text(state.userInfo.data!.creator.nick),
                  ],
                ),
              ),
            ),
          );
        } else {
          return GestureDetector(
            onTap: () {
              showDialog(
                barrierColor: Colors.transparent,
                context: context,
                builder: (context) => LoginDialog(),
                // (BuildContext context) => MultiBlocProvider(
                //   providers: [BlocProvider(create: (context) => UserBloc())],
                //   child: LoginDialog(),
                // ),
              );
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: 53,
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
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
