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
    late final crossAxisCount;
    final double crossAxisSpacing = 10;
    final double childAspectRatio = 0.75;
    final double mainAxisSpacing = 0;
    final itemCount = 12;
    late final rowCount;

    final width = MediaQuery.of(context).size.width - 220 - 80 - 36;
    if (width >= 887 && width < 1069) {
      crossAxisCount = 5;
    } else if (width >= 1069) {
      crossAxisCount = 6;
    } else {
      crossAxisCount = 4;
    }
    rowCount = (itemCount / crossAxisCount).ceil();
    final itemWidth =
        (width - (crossAxisCount - 1) * crossAxisSpacing) / crossAxisCount;
    final itemHeight = itemWidth / childAspectRatio;
    final totalHeight =
        itemHeight * rowCount + mainAxisSpacing * (rowCount - 1);
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoaded) {
          var mydiss = state.userInfo.data!.mydiss;
          return SizedBox(
            height: totalHeight,
            child: GridView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: mainAxisSpacing,
                crossAxisSpacing: crossAxisSpacing,
                childAspectRatio: childAspectRatio,
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
                                  width: itemWidth,
                                  fit: BoxFit.fitWidth,
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
