/*
 * @author: hongyun
 * @since: 2025-06-17
 * my_music_song_item.dart
*/
import 'package:flutter/material.dart';
import 'package:qqmusic/components/z_text/z_text.dart' show ZText;
import 'package:qqmusic/const/const.dart' show PRIMARY_COLOR;
import 'package:qqmusic/const/icon-style.dart' show ICON_STYLE;
import 'package:qqmusic/model/songlist/collect_song.dart';
import 'package:qqmusic/tools/is_vip.dart';

class MyMusicSongItem extends StatefulWidget {
  const MyMusicSongItem({super.key, required this.data});
  final Songlist data;

  @override
  State<MyMusicSongItem> createState() => _MyMusicSongItemState();
}

class _MyMusicSongItemState extends State<MyMusicSongItem> {
  bool mouseInside = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          mouseInside = true;
        });
      },
      onExit: (event) {
        setState(() {
          mouseInside = false;
        });
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
                child: Row(
                  children: [
                    Icon(
                      Icons.favorite_rounded,
                      color: Color.fromRGBO(255, 102, 100, 1.0),
                    ),
                    SizedBox(width: 8),
                    Text(widget.data.title),
                    widget.data.subtitle == ''
                        ? SizedBox()
                        : Flexible(
                          child: Text(
                            '（${widget.data.subtitle}）',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color.fromRGBO(123, 123, 123, 1.0),
                            ),
                          ),
                        ),
                    isVIP(widget.data) ? Text('VIP') : Text('NO'),
                  ],
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
    );
  }
}
