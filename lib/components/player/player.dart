/*
 * @author: hongyun
 * @since: 2025-05-28
 * player.dart
*/
import 'package:flutter/material.dart';
import 'package:qqmusic/components/z_icon/z_icon.dart';
import 'package:qqmusic/components/player/components/text_icon.dart'
    show TextIcon;
import 'package:qqmusic/const/const.dart'
    show PRIMARY_COLOR, PRIMARY_ICON_COLOR;
import 'package:qqmusic/const/icon-style.dart' show ICON_STYLE;

class Player extends StatelessWidget {
  const Player({super.key});

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
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Tooltip(
                        message: '播放',
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
                          child: Icon(Icons.play_arrow_rounded, size: 28),
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
                    Text('00:00', style: TextStyle(fontSize: 11)),
                    SizedBox(width: 8),
                    Flexible(
                      child: Container(
                        color: Color.fromRGBO(229, 229, 229, 1.0),
                        height: 3,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text('03:24', style: TextStyle(fontSize: 11)),
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
