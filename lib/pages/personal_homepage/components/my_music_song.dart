/*
 * @author: hongyun
 * @since: 2025-06-16
 * my_music_song.dart
*/
import 'package:flutter/material.dart';
import 'package:qqmusic/components/z_text/z_text.dart';
import 'package:qqmusic/const/icon-style.dart';
import 'package:qqmusic/model/songlist/collect_song.dart';

class MyMusicSong extends StatefulWidget {
  const MyMusicSong({super.key, required this.data});
  final List<Songlist> data;

  @override
  State<MyMusicSong> createState() => _MyMusicSongState();
}

class _MyMusicSongState extends State<MyMusicSong> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          widget.data
              .map(
                (v) => Row(
                  children: [
                    Flexible(
                      flex: 3,
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite_rounded,
                            color: Color.fromRGBO(255, 102, 100, 1.0),
                          ),
                          Text(v.title),
                          v.subtitle == ''
                              ? SizedBox()
                              : Flexible(
                                child: Text(
                                  '（${v.subtitle}）',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Row(
                        children:
                            v.singer.asMap().entries.map((entry) {
                              final index = entry.key;
                              final item = entry.value;
                              if (index != v.singer.length - 1) {
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
                      flex: 2,
                      child: ZText(
                        text: v.album.title,
                        hoverColor: ICON_STYLE.hoverColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
    );
  }
}
