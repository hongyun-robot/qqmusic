/*
 * @author: hongyun
 * @since: 2025-06-17
 * my_music_song_item.dart
*/
import 'package:flutter/material.dart';
import 'package:qqmusic/components/text_icon/text_icon.dart' show TextIcon;
import 'package:qqmusic/components/z_icon/z_icon.dart';
import 'package:qqmusic/components/z_text/z_text.dart' show ZText;
import 'package:qqmusic/const/const.dart' show PRIMARY_COLOR;
import 'package:qqmusic/const/icon-style.dart' show ICON_STYLE;
import 'package:qqmusic/model/songlist/collect_song.dart';
import 'package:qqmusic/tools/is_vip.dart';

class MyMusicSongItem extends StatefulWidget {
  const MyMusicSongItem({
    super.key,
    required this.data,
    this.active = false,
    this.onTap,
  });
  final Songlist data;
  final bool active;
  final void Function(Songlist data)? onTap;

  @override
  State<MyMusicSongItem> createState() => _MyMusicSongItemState();
}

class _MyMusicSongItemState extends State<MyMusicSongItem> {
  late bool mouseInside;
  late final bool isVip;
  late final bool isMV;
  late final bool isDolby;
  late final bool isMASTER; // 臻品母带2.0
  late final bool isATMOS_2; // 臻品全景声2.0
  late final bool isATMOS_51; // 臻品音质2.0

  String? getDisplayText() {
    if (isDolby) return '杜比';
    if (isMASTER) return '臻品母带';
    if (isATMOS_2) return '全景声';
    if (isATMOS_51) return '臻品音质';
    return null;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mouseInside = widget.active;
    isVip = isVIP(widget.data);
    isMV = widget.data.mv.vid != '';
    isDolby = widget.data.file.sizeDolby != 0;
    isMASTER = widget.data.file.sizeNew![0] != 0;
    isATMOS_2 = widget.data.file.sizeNew![1] != 0;
    isATMOS_51 = widget.data.file.sizeNew![2] != 0;
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
                              Icon(
                                Icons.favorite_rounded,
                                color: Color.fromRGBO(255, 102, 100, 1.0),
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
                                children: [
                                  isVip
                                      ? TextIcon(
                                        icon: 'VIP',
                                        color: ICON_STYLE.hoverColor,
                                        padding: EdgeInsets.fromLTRB(
                                          3,
                                          0,
                                          3,
                                          0,
                                        ),
                                        size: 8,
                                        cursor: SystemMouseCursors.basic,
                                      )
                                      : SizedBox(),
                                  getDisplayText() != null
                                      ? TextIcon(
                                        icon: getDisplayText()!,
                                        color: Color.fromRGBO(
                                          232,
                                          189,
                                          101,
                                          1.0,
                                        ),
                                        padding: EdgeInsets.fromLTRB(
                                          3,
                                          0,
                                          3,
                                          0,
                                        ),
                                        size: 8,
                                        cursor: SystemMouseCursors.basic,
                                      )
                                      : SizedBox(),
                                  isMV
                                      ? TextIcon(
                                        icon: 'MV',
                                        color: Color.fromRGBO(
                                          123,
                                          123,
                                          123,
                                          1.0,
                                        ),
                                        padding: EdgeInsets.fromLTRB(
                                          3,
                                          0,
                                          3,
                                          0,
                                        ),
                                        size: 8,
                                      )
                                      : SizedBox(),
                                ],
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
