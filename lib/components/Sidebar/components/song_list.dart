/*
 * @author: hongyun
 * @since: 2025-06-06
 * song_list.dart
*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qqmusic/api/user/user.dart';
import 'package:qqmusic/bloc/user_bloc.dart' show UserBloc;
import 'package:qqmusic/model/collect_song_list.dart' as CollectSongList;
import 'package:qqmusic/model/song_list.dart' as SongList2;
import 'package:qqmusic/components/sidebar/components/image_icon.dart'
    as ImageIcon2;

class SongList extends StatefulWidget {
  const SongList({super.key});

  @override
  State<SongList> createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  int current = 0;
  Color color = Color.fromRGBO(96, 96, 96, 1.0);
  Color? color1;
  Color? color2;
  List<SongList2.Mlist>? songList;
  List<CollectSongList.Mlist>? collectSongList;
  ListView listViewWidget = ListView.builder(
    itemCount: 0,
    itemBuilder: (BuildContext context, int index) {
      return Text('null');
    },
  );

  @override
  void initState() {
    super.initState();
    UserApi().songList().then((v) {
      if (v.result == 100) {
        const excludeNames = {'QZone背景音乐', '我喜欢', '本地上传'};
        songList =
            v.data?.mlist
                .where((v) => !excludeNames.contains(v.dissName))
                .toList();
        setState(() {
          listViewWidget = ListView.builder(
            itemCount: songList?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              if (songList != null) {
                return ImageIcon2.ImageIcon(
                  src: songList![index].dissCover,
                  text: songList![index].dissName,
                );
              } else {
                return Text('null');
              }
            },
          );
        });
      }
    });
    UserApi().collectSongList().then((v) {
      if (v.result == 100) {
        collectSongList = v.data?.mlist;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    current = 0;
                    listViewWidget = ListView.builder(
                      itemCount: songList?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        if (songList != null) {
                          return ImageIcon2.ImageIcon(
                            src: songList![index].dissCover,
                            text: songList![index].dissName,
                          );
                        } else {
                          return Text('null');
                        }
                      },
                    );
                  });
                },
                child: MouseRegion(
                  onEnter: (event) {
                    setState(() {
                      color1 = Colors.black;
                    });
                  },
                  onExit: (event) {
                    setState(() {
                      color1 = null;
                    });
                  },
                  cursor: SystemMouseCursors.click,
                  child: Text(
                    '自建歌单',
                    style: TextStyle(
                      color: color1 ?? (current == 0 ? Colors.black : color),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 9),
              Text('|', style: TextStyle(fontSize: 12)),
              SizedBox(width: 9),
              GestureDetector(
                onTap: () {
                  setState(() {
                    current = 1;
                    listViewWidget = ListView.builder(
                      itemCount: collectSongList?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        if (collectSongList != null) {
                          return ImageIcon2.ImageIcon(
                            src: collectSongList![index].logo,
                            text: collectSongList![index].dissname,
                          );
                        } else {
                          return Text('null');
                        }
                      },
                    );
                  });
                },
                child: MouseRegion(
                  onEnter: (event) {
                    setState(() {
                      color2 = Colors.black;
                    });
                  },
                  onExit: (event) {
                    setState(() {
                      color2 = null;
                    });
                  },
                  cursor: SystemMouseCursors.click,
                  child: Text(
                    '收藏歌单',
                    style: TextStyle(
                      color: color2 ?? (current == 1 ? Colors.black : color),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Expanded(child: listViewWidget),
        ],
      ),
    );
  }
}
