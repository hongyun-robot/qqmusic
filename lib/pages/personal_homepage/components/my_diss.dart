/*
 * @author: hongyun
 * @since: 2025-06-10
 * my_diss.dart
*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qqmusic/bloc/user_bloc.dart';

class MyDiss extends StatelessWidget {
  const MyDiss({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        print('Current state type: ${state.runtimeType}');
        if (state is UserLoaded) {
          var mydiss = state.userInfo.data!.mydiss;
          int num = mydiss.num;
          int column = (num / 4).ceil();
          return SizedBox(
            height: 260 * column + 15 * (column - 1),
            child: GridView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 15,
                crossAxisSpacing: 10,
                childAspectRatio: 0.85,
              ),
              children:
                  mydiss.mlist
                      .map(
                        (i) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.network(
                                  i.picurl,
                                  height: 210,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Text(i.title),
                            ),
                          ],
                        ),
                      )
                      .toList(),
            ),
          );
        }
        if (state is UserLoginState) {
          return Text(state.isLogin.toString());
        }
        return Text('123');
      },
      buildWhen: (previous, current) => current is UserLoaded,
    );
  }
}
