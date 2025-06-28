/*
 * @author: hongyun
 * @since: 2025-06-16
 * my_music_song.dart
*/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qqmusic/api/song_list/song_list.dart';
import 'package:qqmusic/bloc/music_bloc.dart';
import 'package:qqmusic/model/songlist/collect_song.dart';
import 'package:qqmusic/pages/personal_homepage/components/my_music_song_item.dart';

class MyMusicSong extends StatefulWidget {
  const MyMusicSong({super.key, required this.data, this.dirinfo});
  final List<Songlist> data;
  final Dirinfo? dirinfo;

  @override
  State<MyMusicSong> createState() => _MyMusicSongState();
}

class _MyMusicSongState extends State<MyMusicSong> {
  late MusicBloc _musicBloc;
  int? activeId;

  @override
  void initState() {
    // TODO: implement initState
    _musicBloc = context.read<MusicBloc>();
    super.initState();
  }

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
                  onTap: (Songlist data) {
                    setState(() {
                      activeId = data.id;
                    });
                  },
                  onTapPlay: (Songlist data) {
                    _musicBloc.add(
                      CurrentMusicStateEvent(
                        data,
                        listData: widget.data,
                        dirinfo: widget.dirinfo,
                      ),
                    );
                  },
                  onTapFavorite: (Songlist data) {
                    SongListApi().remove(widget.dirinfo!.dirid, v.id).then((v) {
                      _musicBloc.add(ReloadRequestMusicEvent(true));
                    });
                  },
                ),
              )
              .toList(),
    );
  }
}
