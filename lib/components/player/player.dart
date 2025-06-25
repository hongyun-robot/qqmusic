/*
 * @author: hongyun
 * @since: 2025-05-28
 * player.dart
*/
import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:qqmusic/components/z_icon/z_icon.dart';
import 'package:qqmusic/components/text_icon/text_icon.dart' show TextIcon;
import 'package:qqmusic/const/const.dart'
    show PRIMARY_COLOR, PRIMARY_ICON_COLOR;
import 'package:qqmusic/const/icon-style.dart' show ICON_STYLE;
import 'package:qqmusic/tools/format_duration.dart';

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  final soloud = SoLoud.instance;
  SoundHandle? handle;
  AudioSource? source;
  Duration duration = Duration(seconds: 0);
  Duration curPos = Duration(seconds: 0);
  bool isPaused = true;
  late Timer timer;
  double progressBarWidth = 0.0;

  @override
  void initState() {
    super.initState();
  }

  void initSource() async {
    source = await soloud.loadUrl(
      'http://isure6-stream-qqmusic.a.bdycdn.cn/aqqmusic.tc.qq.com/O600003FE6zi2r4TAF.ogg?fromtag=120073&guid=6435693729&qqm_typec_md5hash=ab2968ef8d57fa304b1eca42cb6704da&qqm_typec_timestamp=685a398a&uin=1836017030&vkey=79ECE0D5B2F0B93BE31888E32E07A38460D91A62671726C779BED52E9A39566BEF36461DF254CD94581F111AB20154CB3C7FB93FAE7B0205__v215257eb0',
    );

    source!.allInstancesFinished.first.then((_) {
      soloud.disposeSource(source!);
      timer.cancel();
    });

    // handle
  }

  void initHandle() async {
    handle = await soloud.play(source!);
    setState(() {
      duration = soloud.getLength(source!);
      isPaused = false;
    });
    initTimer();
  }

  void initTimer() {
    if (handle != null) {
      timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
        setState(() {
          curPos = soloud.getPosition(handle!);

          print('curpos = ${curPos.toString()}');
          progressBarWidth = curPos.inMicroseconds / duration.inMicroseconds;
        });
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // player.dispose();
    timer.cancel();
    SoLoud.instance.deinit();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 0, 13, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: const Image(
                    width: 50,
                    height: 50,
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/demo/song_pic.webp'),
                  ),
                ),
                SizedBox(width: 11),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [Text('淋雨一直走'), Text('-'), Text('张韶涵')]),
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
                            border: Border.all(color: ICON_STYLE.defaultColor),
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
              ],
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
                      ),
                    ),
                    SizedBox(width: 18),
                    // pause
                    GestureDetector(
                      onTap: () {
                        if (handle != null) {
                          SoLoud.instance.setPause(
                            handle!,
                            !SoLoud.instance.getPause(handle!),
                          );
                          setState(() {
                            isPaused = SoLoud.instance.getPause(handle!);
                            if (isPaused) {
                              timer.cancel();
                            } else {
                              initTimer();
                            }
                          });
                        }
                      },
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
