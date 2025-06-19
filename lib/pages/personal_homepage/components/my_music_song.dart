/*
 * @author: hongyun
 * @since: 2025-06-16
 * my_music_song.dart
*/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qqmusic/bloc/scroll_bloc.dart';
import 'package:qqmusic/components/z_text/z_text.dart';
import 'package:qqmusic/const/icon-style.dart';
import 'package:qqmusic/model/songlist/collect_song.dart';
import 'package:qqmusic/pages/personal_homepage/components/my_music_song_item.dart';

class MyMusicSong extends StatefulWidget {
  const MyMusicSong({super.key, required this.data});
  final List<Songlist> data;

  @override
  State<MyMusicSong> createState() => _MyMusicSongState();
}

class _MyMusicSongState extends State<MyMusicSong> {
  int? activeId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          widget.data
              .map(
                (v) => MyMusicSongItem(
                  // key: ValueKey(v.id),
                  data: v,
                  active: activeId == v.id,
                  onTap: (data) {
                    setState(() {
                      activeId = data.id;
                    });
                  },
                ),
              )
              .toList(),
    );
  }
}
