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

class PersonalHomepage extends StatefulWidget {
  const PersonalHomepage({super.key});

  @override
  State<PersonalHomepage> createState() => _PersonalHomepageState();
}

class _PersonalHomepageState extends State<PersonalHomepage> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(UserLoadedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 23),
      color: Color.fromRGBO(246, 246, 246, 1.0),
      child: BlocBuilder<UserBloc, UserState>(
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
                            Text(
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
                        Text(
                          '暂无',
                          style: TextStyle(
                            color: Color.fromRGBO(123, 123, 123, 1.0),
                          ),
                        ),
                        SizedBox(height: 25),
                        Row(
                          children: [
                            Text(
                              '粉丝：${state.userInfo.data!.creator.nums.fansnum}',
                            ),
                            SizedBox(width: 18),
                            Text(
                              '关注：${state.userInfo.data!.creator.nums.follownum}',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          }
          return Text('');
        },
      ),
    );
  }
}
