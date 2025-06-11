/*
 * @author: hongyun
 * @since: 2025-06-10
 * my_diss.dart
*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qqmusic/bloc/user_bloc.dart';
import 'package:qqmusic/components/z_icon/z_icon.dart' show ZIcon;
import 'package:qqmusic/const/icon-style.dart' show ICON_STYLE;

class MyDiss extends StatefulWidget {
  const MyDiss({super.key});

  @override
  State<MyDiss> createState() => _MyDissState();
}

class _MyDissState extends State<MyDiss> {
  int? current;
  int? currentItem;
  int? currentItemTitle;
  final Color maskColor = Color.fromRGBO(0, 0, 0, 0.5);
  final Matrix4 translationValues = Matrix4.translationValues(0, -10, 0);

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
                        (i) => MouseRegion(
                          onEnter: (event) {
                            setState(() {
                              currentItem = i.dissid;
                            });
                          },
                          onExit: (event) {
                            setState(() {
                              currentItem = null;
                            });
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                onEnter: (event) {
                                  setState(() {
                                    current = i.dissid;
                                  });
                                },
                                onExit: (event) {
                                  setState(() {
                                    current = null;
                                  });
                                },
                                child: AnimatedContainer(
                                  width: itemWidth,
                                  transform:
                                      current == i.dissid
                                          ? translationValues
                                          : Matrix4.translationValues(0, 0, 0),
                                  duration: Duration(milliseconds: 200),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Stack(
                                    children: [
                                      Image.network(
                                        i.picurl,
                                        width: itemWidth,
                                        fit: BoxFit.fitWidth,
                                      ),
                                      AnimatedContainer(
                                        duration: Duration(milliseconds: 150),
                                        color:
                                            current == i.dissid
                                                ? maskColor
                                                : Colors.transparent,
                                        height: itemWidth,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    flex: 10,
                                    child: MouseRegion(
                                      onEnter: (event) {
                                        setState(() {
                                          currentItemTitle = i.dissid;
                                        });
                                      },
                                      onExit: (event) {
                                        setState(() {
                                          currentItemTitle = null;
                                        });
                                      },
                                      cursor: SystemMouseCursors.click,
                                      child: Text(
                                        i.title,
                                        softWrap: true,
                                        style: TextStyle(
                                          color:
                                              currentItemTitle == i.dissid
                                                  ? ICON_STYLE.hoverColor
                                                  : null,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child:
                                        currentItem == i.dissid
                                            ? MouseRegion(
                                              cursor: SystemMouseCursors.click,
                                              child: ZIcon(
                                                icon:
                                                    Icons
                                                        .delete_outline_rounded,
                                                color: ICON_STYLE.defaultColor,
                                                hoverColor:
                                                    ICON_STYLE.hoverColor,
                                                size: 16,
                                              ),
                                            )
                                            : SizedBox(),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
