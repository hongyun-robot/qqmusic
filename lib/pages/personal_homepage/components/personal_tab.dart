/*
 * @author: hongyun
 * @since: 2025-06-10
 * personal_tab.dart
*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;
import 'package:qqmusic/bloc/user_bloc.dart'
    show UserBloc, UserLoaded, UserState;
import 'package:qqmusic/const/const.dart' show PRIMARY_ICON_COLOR;
import 'package:qqmusic/pages/personal_homepage/components/my_diss.dart';
import 'package:qqmusic/pages/personal_homepage/components/my_music.dart';
import 'package:qqmusic/pages/personal_homepage/components/my_radio.dart';

class PersonalTab extends StatefulWidget {
  const PersonalTab({super.key});

  @override
  State<PersonalTab> createState() => _PersonalTabState();
}

class _PersonalTabState extends State<PersonalTab> {
  int active = 2;
  Color color1 = Colors.black;
  Color color2 = Colors.black;
  Color color3 = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            spacing: 54,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    active = 1;
                  });
                },
                child: MouseRegion(
                  onEnter: (event) {
                    setState(() {
                      color1 = PRIMARY_ICON_COLOR;
                    });
                  },
                  onExit: (event) {
                    setState(() {
                      color1 = Colors.black;
                    });
                  },
                  cursor: SystemMouseCursors.click,
                  child: Text(
                    '我喜欢',
                    style: TextStyle(
                      color: active == 1 ? PRIMARY_ICON_COLOR : color1,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    active = 2;
                  });
                },
                child: MouseRegion(
                  onEnter: (event) {
                    setState(() {
                      color2 = PRIMARY_ICON_COLOR;
                    });
                  },
                  onExit: (event) {
                    setState(() {
                      color2 = Colors.black;
                    });
                  },
                  cursor: SystemMouseCursors.click,
                  child: BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is UserLoaded) {
                        return Text(
                          '创建的歌单${state.userInfo.data!.mydiss.num}',
                          style: TextStyle(
                            color: active == 2 ? PRIMARY_ICON_COLOR : color2,
                          ),
                        );
                      }
                      return Text(
                        '创建的歌单',
                        style: TextStyle(
                          color: active == 2 ? PRIMARY_ICON_COLOR : color2,
                        ),
                      );
                    },
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    active = 3;
                  });
                },
                child: MouseRegion(
                  onEnter: (event) {
                    setState(() {
                      color3 = PRIMARY_ICON_COLOR;
                    });
                  },
                  onExit: (event) {
                    setState(() {
                      color3 = Colors.black;
                    });
                  },
                  cursor: SystemMouseCursors.click,
                  child: Text(
                    '上传的视频',
                    style: TextStyle(
                      color: active == 3 ? PRIMARY_ICON_COLOR : color3,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          if (active == 1) ...[
            MyMusic(),
          ] else if (active == 2) ...[
            MyDiss(),
          ] else ...[
            MyRadio(),
          ],
        ],
      ),
    );
  }
}
