/*
 * @author: hongyun
 * @since: 2025-06-10
 * personal_tab.dart
*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;
import 'package:qqmusic/bloc/user_bloc.dart'
    show UserBloc, UserLoaded, UserState;
import 'package:qqmusic/components/z_text/z_text.dart';
import 'package:qqmusic/const/icon-style.dart';
import 'package:qqmusic/pages/personal_homepage/components/my_diss.dart';
import 'package:qqmusic/pages/personal_homepage/components/my_music.dart';
import 'package:qqmusic/pages/personal_homepage/components/my_radio.dart';

class PersonalTab extends StatefulWidget {
  const PersonalTab({super.key});

  @override
  State<PersonalTab> createState() => _PersonalTabState();
}

class _PersonalTabState extends State<PersonalTab> {
  int active = 1;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            spacing: 54,
            children: [
              ZText(
                text: '我喜欢',
                hoverColor: ICON_STYLE.hoverColor,
                color: active == 1 ? ICON_STYLE.hoverColor : Colors.black,
                onTap: () {
                  setState(() {
                    active = 1;
                  });
                },
              ),
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  int num = 0;
                  if (state is UserLoaded) {
                    num = state.userInfo.data!.mydiss.num;
                  }
                  return ZText(
                    text: '创建的歌单$num',
                    hoverColor: ICON_STYLE.hoverColor,
                    color: active == 2 ? ICON_STYLE.hoverColor : Colors.black,
                    onTap: () {
                      setState(() {
                        active = 2;
                      });
                    },
                  );
                },
              ),
              ZText(
                text: '上传的视频',
                hoverColor: ICON_STYLE.hoverColor,
                color: active == 3 ? ICON_STYLE.hoverColor : Colors.black,
                onTap: () {
                  setState(() {
                    active = 3;
                  });
                },
              ),
            ],
          ),
          if (active == 1) ...[
            SizedBox(height: 30),
            MyMusic(),
          ] else if (active == 2) ...[
            SizedBox(height: 40),
            MyDiss(),
          ] else ...[
            MyRadio(),
          ],
        ],
      ),
    );
  }
}
