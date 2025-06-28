/*
 * @author: hongyun
 * @since: 2025-05-28
 * player.dart
*/
import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:qqmusic/api/song/song.dart';
import 'package:qqmusic/bloc/music_bloc.dart';
import 'package:qqmusic/components/z_icon/z_icon.dart';
import 'package:qqmusic/components/text_icon/text_icon.dart' show TextIcon;
import 'package:qqmusic/const/const.dart'
    show PRIMARY_COLOR, PRIMARY_ICON_COLOR, SongType;
import 'package:qqmusic/const/icon-style.dart' show ICON_STYLE;
import 'package:qqmusic/model/song/song.dart';
import 'package:qqmusic/tools/format_duration.dart';
import 'package:qqmusic/tools/music_img_url.dart';

class Player extends StatefulWidget {
  const Player({super.key, required this.onTapMusicList});
  final void Function() onTapMusicList;

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  late final MusicBloc _musicBloc;
  Song? curMusicData;
  final soloud = SoLoud.instance;
  SoundHandle? handle;
  AudioSource? source;
  Duration duration = Duration(seconds: 0);
  Duration curPos = Duration(seconds: 0);
  bool isPaused = true;
  Timer? timer;
  double progressBarWidth = 0.0;

  @override
  void initState() {
    _musicBloc = context.read<MusicBloc>();
    super.initState();
  }

  void initSource(String url) async {
    if (url == '') return;
    if (source != null) {
      soloud.disposeAllSources();
      // soloud.disposeSource(source!);
    }
    source = await soloud.loadUrl(url);

    source!.allInstancesFinished.first.then((_) {
      soloud.disposeSource(source!);
      timer!.cancel();
      _musicBloc.add(CurMusicAddEvent());
    });
    initHandle();

    // handle
  }

  void initHandle() async {
    if (handle != null) {
      bool isPlaying = soloud.getIsValidVoiceHandle(handle!);
      if (isPlaying) {
        soloud.stop(handle!);
      }
    }
    handle = await soloud.play(source!);
    // handle
    setState(() {
      duration = soloud.getLength(source!);
      isPaused = false;
    });
    initTimer();
  }

  void initTimer() {
    if (handle != null) {
      if (timer != null) {
        timer!.cancel();
      }
      timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
        setState(() {
          curPos = soloud.getPosition(handle!);

          progressBarWidth = curPos.inMicroseconds / duration.inMicroseconds;
        });
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // player.dispose();
    if (timer != null) {
      timer!.cancel();
    }
    SoLoud.instance.deinit();
    super.dispose();
  }

  void onTapMusicList() {
    widget.onTapMusicList();
  }

  void onTapNextMusic() {
    _musicBloc.add(CurMusicAddEvent());
  }

  void onTapPrevMusic() {
    _musicBloc.add(CurMusicSubEvent());
  }

  void onTapPlayOrPause() {
    if (handle != null) {
      SoLoud.instance.setPause(handle!, !SoLoud.instance.getPause(handle!));
      setState(() {
        isPaused = SoLoud.instance.getPause(handle!);
        if (isPaused) {
          timer!.cancel();
        } else {
          initTimer();
        }
      });
    }
  }

  /// 生成 TextSpan 列表
  List<InlineSpan> joinSingerName(
    List<Singer> singer,
    void Function(Singer singer) onTap,
  ) {
    int length = singer.length + (singer.length - 1);
    List<Singer> data = [];
    for (var i = 0; i < length; i++) {
      if (i % 2 == 0) {
        data.add(singer[(i / 2).floor()]);
      } else {
        data.add(
          Singer(id: 0, mid: '0', name: '/', title: '/', type: 0, uin: 0),
        );
      }
    }
    return data
        .map(
          (v) => TextSpan(
            text: v.title,
            style: TextStyle(color: Colors.black),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    onTap(v);
                  },
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 0, 13, 0),
      child: BlocListener<MusicBloc, MusicState>(
        listenWhen:
            (previous, current) =>
                current is CurrentMusicInfoState ||
                current is CurrentPlayListState,
        listener: (context, state) {
          if (state is CurrentMusicInfoState) {
            curMusicData = state.data;
            SongApi()
                .url(state.data.data!.trackInfo.mid, SongType.standard, 0)
                .then((v) {
                  if (v.result == 100) {
                    String url =
                        v.data!.rawData.req0.data.midurlinfo[0].xcdnurl;
                    initSource(url);
                  }
                });
          }

          if (state is CurrentPlayListState) {
            _musicBloc.add(
              CurrentPlayListInIndexEvent(
                state.listData!.indexWhere(
                  (v) => v.id == curMusicData!.data!.trackInfo.id,
                ),
              ),
            );
          }

          // if (state is CurrentMusicListState) {

          // }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: BlocBuilder<MusicBloc, MusicState>(
                buildWhen:
                    (previous, current) => current is CurrentMusicInfoState,
                builder: (context, state) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (state is CurrentMusicInfoState)
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: Image(
                            width: 50,
                            height: 50,
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              getMusicImageUrl(state.data.data!.trackInfo),
                            ),
                          ),
                        )
                      else
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: const Image(
                            width: 50,
                            height: 50,
                            fit: BoxFit.fill,
                            image: AssetImage(
                              'assets/images/demo/song_pic.webp',
                            ),
                          ),
                        ),
                      SizedBox(width: 11),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (state is CurrentMusicInfoState)
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: state.data.data!.trackInfo.title,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: ' - ',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    ...joinSingerName(
                                      state.data.data!.trackInfo.singer,
                                      (v) {
                                        print(v.title);
                                      },
                                    ),
                                  ],
                                ),
                                overflow: TextOverflow.ellipsis,
                              )
                            // Row(
                            //   children: [
                            //     Text(state.data.data!.trackInfo.name),
                            //     Text('-'),
                            //     Text(
                            //       joinSingerName(
                            //         state.data.data!.trackInfo.singer,
                            //       ),
                            //     ),
                            //   ],
                            // )
                            else
                              Row(children: [Text('/'), Text('-'), Text('/')]),
                            SizedBox(height: 13),
                            Row(
                              spacing: 22.0,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // Icon(Icons.favorite_rounded, color: Colors.red),
                                ZIcon(
                                  icon: Icons.favorite_rounded,
                                  color: Color.fromRGBO(255, 106, 106, 1.0),
                                  hoverColor: Color.fromRGBO(244, 85, 85, 1.0),
                                  message: '取消喜欢',
                                  size: 22,
                                ),
                                // Icon(Icons.comment_rounded),
                                ZIcon(
                                  icon: Icons.comment_rounded,
                                  color: ICON_STYLE.defaultColor,
                                  hoverColor: ICON_STYLE.hoverColor,
                                  message: '评论',
                                  size: 21,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: ICON_STYLE.defaultColor,
                                    ),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: ZIcon(
                                    icon: Icons.more_horiz_rounded,
                                    color: ICON_STYLE.defaultColor,
                                    hoverColor: ICON_STYLE.hoverColor,
                                    message: '更多',
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // repeat_one_rounded
                      // refresh
                      ZIcon(
                        icon: Icons.repeat_rounded,
                        color: ICON_STYLE.defaultColor,
                        hoverColor: ICON_STYLE.hoverColor,
                        message: '列表循环',
                        size: 30,
                      ),
                      SizedBox(width: 36),
                      RotatedBox(
                        quarterTurns: 2,
                        child: ZIcon(
                          icon: Icons.last_page_rounded,
                          color: Colors.black,
                          hoverColor: ICON_STYLE.hoverColor,
                          message: '上一首',
                          size: 28,
                          onTap: onTapPrevMusic,
                        ),
                      ),
                      SizedBox(width: 18),
                      // pause
                      GestureDetector(
                        onTap: onTapPlayOrPause,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Tooltip(
                            message: isPaused ? '播放' : '暂停',
                            padding: EdgeInsets.all(0),
                            waitDuration: const Duration(seconds: 1),
                            textStyle: TextStyle(color: Colors.black),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black),
                            ),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
                              decoration: BoxDecoration(
                                color: PRIMARY_ICON_COLOR,
                                borderRadius: BorderRadius.circular(60),
                              ),
                              child: Icon(
                                isPaused
                                    ? Icons.play_arrow_rounded
                                    : Icons.pause_rounded,
                                size: 28,
                              ),
                              // child: Icon(Icons.pause_rounded, size: 28),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 18),
                      ZIcon(
                        icon: Icons.last_page_rounded,
                        color: Colors.black,
                        hoverColor: ICON_STYLE.hoverColor,
                        message: '下一首',
                        size: 28,
                        onTap: onTapNextMusic,
                      ),
                      SizedBox(width: 32),
                      ZIcon(
                        icon: Icons.volume_down_rounded,
                        color: ICON_STYLE.defaultColor,
                        hoverColor: ICON_STYLE.hoverColor,
                        message: '音量：100%',
                        size: 32,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        formatDuration(curPos),
                        style: TextStyle(fontSize: 11),
                      ),
                      SizedBox(width: 8),
                      Flexible(
                        child: Stack(
                          children: [
                            Container(
                              color: Color.fromRGBO(229, 229, 229, 1.0),
                              height: 3,
                            ),
                            FractionallySizedBox(
                              widthFactor: progressBarWidth,
                              child: AnimatedContainer(
                                duration: Duration(seconds: 1),
                                color: Colors.black,
                                height: 3,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        formatDuration(duration),
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextIcon(
                    icon: 'HQ',
                    color: ICON_STYLE.hoverColor,
                    message: '打开歌词',
                    padding: EdgeInsets.fromLTRB(6, 2, 6, 2),
                    size: 9,
                  ),
                  SizedBox(width: 19),
                  ZIcon(
                    icon: Icons.gesture_rounded,
                    color: ICON_STYLE.defaultColor,
                    hoverColor: ICON_STYLE.hoverColor,
                    message: '音效',
                    size: 28,
                  ),
                  SizedBox(width: 19),
                  TextIcon(
                    icon: '词',
                    color: ICON_STYLE.defaultColor,
                    hoverColor: ICON_STYLE.hoverColor,
                    message: '打开歌词',
                    padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
                    size: 13,
                  ),
                  SizedBox(width: 19),
                  ZIcon(
                    icon: Icons.playlist_play_rounded,
                    color: ICON_STYLE.defaultColor,
                    hoverColor: ICON_STYLE.hoverColor,
                    message: '播放队列',
                    size: 36,
                    onTap: onTapMusicList,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
