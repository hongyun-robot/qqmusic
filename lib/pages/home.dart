import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;
import 'package:provider/provider.dart';
import 'package:qqmusic/bloc/music_bloc.dart';
import 'package:qqmusic/bloc/scroll_bloc.dart';
import 'package:qqmusic/components/play_list_item/play_list_item.dart';
import 'package:qqmusic/components/player/player.dart';
import 'package:qqmusic/components/sidebar/sidebar.dart';
import 'package:qqmusic/components/text_icon/text_icon.dart';
import 'package:qqmusic/components/topbar/topbar.dart';
import 'package:qqmusic/const/icon-style.dart';

class HomePage extends StatefulWidget {
  const HomePage({required this.child, super.key});
  final Widget child;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();
  late final ScrollBloc _scrollBloc;
  bool isShowTopBtn = false;
  bool isShowEndDrawer = false;

  @override
  void initState() {
    _scrollBloc = context.read<ScrollBloc>();
    _scrollBloc.add(ScrollLoadedEvent(_controller));
    // TODO: implement initState
    _controller.addListener(() {
      if (_controller.offset > 0) {
        setState(() {
          isShowTopBtn = true;
        });
      } else {
        setState(() {
          isShowTopBtn = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext build) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: Color.fromRGBO(240, 240, 240, 1.0),
          body: Padding(
            padding: const EdgeInsets.only(
              left: 18,
              right: 18,
              bottom: 18,
              top: 10,
            ),
            child: Row(
              children: [
                SafeArea(child: Sidebar()),
                Flexible(
                  child: Column(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Topbar(),
                            Expanded(
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    SingleChildScrollView(
                                      controller: _controller,
                                      child: Container(
                                        constraints: constraints.copyWith(
                                          minHeight: 0,
                                          maxHeight: double.infinity,
                                        ),
                                        clipBehavior: Clip.hardEdge,
                                        padding: const EdgeInsets.only(
                                          left: 40,
                                          right: 40,
                                          top: 23,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(
                                            246,
                                            246,
                                            246,
                                            1.0,
                                          ),
                                        ),
                                        child: IntrinsicHeight(
                                          child: widget.child,
                                        ),
                                      ),
                                    ),
                                    if (isShowTopBtn)
                                      Positioned(
                                        bottom: 10,
                                        right: 30,
                                        child: TextIcon(
                                          icon: '∧',
                                          size: 20,
                                          padding: EdgeInsets.only(
                                            left: 8,
                                            right: 8,
                                            bottom: 3,
                                          ),
                                          color: ICON_STYLE.defaultColor,
                                          hoverColor: ICON_STYLE.hoverColor,
                                          onTap: () {
                                            _controller.animateTo(
                                              0,
                                              duration: const Duration(
                                                milliseconds: 500,
                                              ),
                                              curve: Curves.ease,
                                            );
                                          },
                                        ),
                                      ),

                                    // if (isShowEndDrawer)
                                    AnimatedPositioned(
                                      curve: Curves.easeInOut,
                                      duration: Duration(milliseconds: 300),
                                      right: isShowEndDrawer ? 10 : -448,
                                      top: 0,
                                      bottom: 0,
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(
                                          10,
                                          37,
                                          10,
                                          0,
                                        ),
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                          ),
                                        ),
                                        width: 448,
                                        child: BlocBuilder<
                                          MusicBloc,
                                          MusicState
                                        >(
                                          buildWhen:
                                              (previous, current) =>
                                                  current
                                                      is CurrentMusicInfoState,
                                          builder: (context, state) {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '播放队列',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .format_list_numbered_rounded,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 28),
                                                if (state
                                                    is CurrentMusicInfoState)
                                                  Text(
                                                    '共${state.listData?.length ?? 0}首歌曲',
                                                    style: TextStyle(
                                                      color: Color.fromRGBO(
                                                        102,
                                                        102,
                                                        102,
                                                        1.0,
                                                      ),
                                                    ),
                                                  ),
                                                SizedBox(height: 8),
                                                Expanded(
                                                  child:
                                                      state is CurrentMusicInfoState
                                                          ? state.listData !=
                                                                  null
                                                              ? PlayListItem(
                                                                listData:
                                                                    state
                                                                        .listData!,
                                                              )
                                                              : SizedBox()
                                                          : SizedBox(),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 12),
                            Container(
                              height: 77,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(246, 246, 246, 1.0),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              child: Player(
                                onTapMusicList: () {
                                  setState(() {
                                    isShowEndDrawer = !isShowEndDrawer;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
