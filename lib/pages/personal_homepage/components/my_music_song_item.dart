/*
 * @author: hongyun
 * @since: 2025-06-17
 * my_music_song_item.dart
*/
import 'package:flutter/material.dart';
import 'package:qqmusic/components/z_icon/z_icon.dart';
import 'package:qqmusic/components/z_text/z_text.dart' show ZText;
import 'package:qqmusic/const/const.dart' show PRIMARY_COLOR;
import 'package:qqmusic/const/icon-style.dart' show ICON_STYLE;
import 'package:qqmusic/model/songlist/collect_song.dart';
import 'package:qqmusic/tools/get_display_text.dart';

class MyMusicSongItem extends StatefulWidget {
  const MyMusicSongItem({
    super.key,
    required this.data,
    this.active = false,
    this.onTap,
    this.onTapPlay,
    this.onTapFavorite,
  });
  final Songlist data;
  final bool active;
  final void Function(Songlist data)? onTap;

  /// 点击播放按钮
  final void Function(Songlist data)? onTapPlay;

  /// 点击爱心
  final void Function(Songlist data)? onTapFavorite;

  @override
  State<MyMusicSongItem> createState() => _MyMusicSongItemState();
}

class _MyMusicSongItemState extends State<MyMusicSongItem> {
  late bool mouseInside;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mouseInside = widget.active;
  }

  @override
  void didUpdateWidget(covariant MyMusicSongItem oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget.active != widget.active) {
      setState(() {
        mouseInside = widget.active;
      });
    }
  }

  // void onTapPlay() {
  //   _musicBloc.add(CurrentMusicStateEvent(widget.data));
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!(widget.data);
        }
      },
      child: MouseRegion(
        onEnter: (event) {
          if (!widget.active) {
            setState(() {
              mouseInside = true;
            });
          }
        },
        onExit: (event) {
          if (!widget.active) {
            setState(() {
              mouseInside = false;
            });
          }
        },
        child: Container(
          color: mouseInside ? PRIMARY_COLOR : Colors.transparent,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 24),
            child: Row(
              children: [
                Flexible(
                  flex: 47,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Row(
                            children: [
                              ZIcon(
                                icon: Icons.favorite_rounded,
                                color: Color.fromRGBO(255, 106, 106, 1.0),
                                hoverColor: Color.fromRGBO(244, 85, 85, 1.0),
                                message: '取消喜欢',
                                size: 22,
                                onTap: () {
                                  if (widget.onTapFavorite != null) {
                                    widget.onTapFavorite!(widget.data);
                                  }
                                },
                              ),
                              SizedBox(width: 8),
                              // 标题
                              Flexible(
                                child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: widget.data.title,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      TextSpan(
                                        text:
                                            widget.data.subtitle != ''
                                                ? '（${widget.data.subtitle}）'
                                                : '',
                                        style: TextStyle(
                                          color: Color.fromRGBO(
                                            123,
                                            123,
                                            123,
                                            1.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              // 图标
                              Row(
                                spacing: 5,
                                children: createIdentificationIcon(widget.data),
                              ),
                            ],
                          ),
                        ),
                        // 操作按钮
                        mouseInside
                            ? Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ZIcon(
                                  icon: Icons.play_arrow_rounded,
                                  color: Color.fromRGBO(96, 96, 96, 1.0),
                                  hoverColor: ICON_STYLE.hoverColor,
                                  onTap: () {
                                    if (widget.onTapPlay != null) {
                                      widget.onTapPlay!(widget.data);
                                    }
                                  },
                                ),
                                ZIcon(
                                  icon: Icons.add_circle_rounded,
                                  color: Color.fromRGBO(96, 96, 96, 1.0),
                                  hoverColor: ICON_STYLE.hoverColor,
                                ),
                                ZIcon(
                                  icon: Icons.download_rounded,
                                  color: Color.fromRGBO(96, 96, 96, 1.0),
                                  hoverColor: ICON_STYLE.hoverColor,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromRGBO(96, 96, 96, 1.0),
                                    ),
                                    borderRadius: BorderRadius.circular(1000),
                                  ),
                                  child: ZIcon(
                                    icon: Icons.more_horiz_rounded,
                                    color: Color.fromRGBO(96, 96, 96, 1.0),
                                    hoverColor: ICON_STYLE.hoverColor,
                                  ),
                                ),
                              ],
                            )
                            : SizedBox(),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 25,
                  // child: Text.rich(
                  //   overflow: TextOverflow.ellipsis,
                  //   TextSpan(
                  //     children: RichTextExt.createTextSpans(
                  //       // text: widget.data.singer.map((v) => v.name).toString(),
                  //       text: '爱的胡斐和v挨揍返回',
                  //       textTaps: ['斐和'],
                  //       // textTaps:
                  //       //     widget.data.singer.map((v) => v.name).toList(),
                  //       onLink: (text) {
                  //         print(text);
                  //       },
                  //     ),
                  //   ),
                  // ),
                  child: Row(
                    children:
                        widget.data.singer.asMap().entries.map((entry) {
                          final index = entry.key;
                          final item = entry.value;
                          if (index != widget.data.singer.length - 1) {
                            return Row(
                              children: [
                                ZText(
                                  text: item.title,
                                  hoverColor: ICON_STYLE.hoverColor,
                                ),
                                Text(' / '),
                              ],
                            );
                          }
                          return Flexible(
                            child: ZText(
                              text: item.title,
                              hoverColor: ICON_STYLE.hoverColor,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }).toList(),
                  ),
                ),
                Flexible(
                  flex: 26,
                  child: ZText(
                    text: widget.data.album.title,
                    hoverColor: ICON_STYLE.hoverColor,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
