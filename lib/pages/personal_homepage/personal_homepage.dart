/*
 * @author: hongyun
 * @since: 2025-06-09
 * personal_homepage.dart
*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;
import 'package:provider/provider.dart';
import 'package:qqmusic/bloc/user_bloc.dart'
    show UserBloc, UserLoaded, UserLoadedEvent, UserState;
import 'package:qqmusic/components/z_text/z_text.dart';
import 'package:qqmusic/const/icon-style.dart';
import 'package:qqmusic/pages/personal_homepage/components/personal_tab.dart'
    show PersonalTab;

class PersonalHomepage extends StatefulWidget {
  const PersonalHomepage({super.key});

  @override
  State<PersonalHomepage> createState() => _PersonalHomepageState();
}

class _PersonalHomepageState extends State<PersonalHomepage> {
  @override
  void initState() {
    super.initState();
    // context.read<UserBloc>().add(UserLoadedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) => current is UserLoaded,
      builder: (context, state) {
        if (state is UserLoaded) {
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10000),
                    ),
                    child: Image.network(
                      state.userInfo.data!.creator.headpic,
                      width: 170,
                      height: 170,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(width: 27),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SelectableText(
                            state.userInfo.data!.creator.nick,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(width: 10),
                          ...state.userInfo.data!.creator.userInfoUi.iconlist
                              .map(
                                (i) => Container(
                                  margin: EdgeInsets.only(right: 5),
                                  child: Image.network(
                                    i.srcUrl,
                                    // width: 22,
                                    height: 25,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                        ],
                      ),
                      SizedBox(height: 25),
                      SelectableText(
                        '暂无',
                        style: TextStyle(
                          color: Color.fromRGBO(123, 123, 123, 1.0),
                        ),
                      ),
                      SizedBox(height: 25),
                      Row(
                        children: [
                          Text('粉丝：'),
                          ZText(
                            text:
                                '${state.userInfo.data!.creator.nums.fansnum}',
                            hoverColor: ICON_STYLE.hoverColor,
                          ),
                          SizedBox(width: 18),
                          Text('关注：'),
                          ZText(
                            text:
                                '${state.userInfo.data!.creator.nums.follownum}',
                            hoverColor: ICON_STYLE.hoverColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              PersonalTab(),
            ],
          );
        }
        return Text('');
      },
    );
  }
}
