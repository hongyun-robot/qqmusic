/*
 * @author: hongyun
 * @since: 2025-06-10
 * my_music.dart
*/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qqmusic/api/user/song_list.dart';
import 'package:qqmusic/api/user/user.dart' show UserApi;
import 'package:qqmusic/bloc/user_bloc.dart';
import 'package:qqmusic/components/item_grid_view/item_grid_view.dart';
import 'package:qqmusic/components/z_text/z_text.dart';
import 'package:qqmusic/const/icon-style.dart' show ICON_STYLE;
import 'package:qqmusic/model/collect_song_list.dart' show Mlist;
import 'package:qqmusic/model/m_list_base.dart' show MListBase;
import 'package:qqmusic/model/songlist/collect_song.dart';
import 'package:qqmusic/pages/personal_homepage/components/model/tab_config.dart';
import 'package:qqmusic/pages/personal_homepage/components/my_music_song.dart'
    show MyMusicSong;

class MyMusic extends StatefulWidget {
  const MyMusic({super.key});

  @override
  State<MyMusic> createState() => _MyMusicState();
}

class _MyMusicState extends State<MyMusic> {
  int active = 2;
  late final List<TabConfig> tabConfig;
  List<MListBase> listData = [];
  List<Songlist> musicData = [];
  late UserState _userState;

  void getData() {
    UserApi().collectSongList().then((v) {
      if (v.result == 100) {
        setState(() {
          listData = v.data!.mlist;
        });
      } else {
        listData = [];
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _userState = context.read<UserBloc>().state;
    getData();
    tabConfig = [
      TabConfig(
        id: 1,
        name: '歌曲',
        idKey: '',
        imgKey: '',
        titleKey: '',
        subTileKey: '',
        onTab: (TabConfig i) async {
          if (_userState is UserLoaded) {
            SongListApi()
                .collectSong(
                  int.parse(
                    (_userState as UserLoaded).userInfo.data!.mymusic[0].id,
                  ),
                  0,
                  50,
                )
                .then((v) {
                  if (v.result == 100) {
                    setState(() {
                      musicData = v.data!.req1.data!.songlist;
                    });
                  }
                });
          }
        },
        onIconTap: <MListBase>(MListBase i) {},
      ),
      TabConfig(
        id: 2,
        name: '歌单',
        idKey: 'dissid',
        imgKey: 'logo',
        titleKey: 'dissname',
        subTileKey: 'nickname',
        onTab: (TabConfig i) async {
          setState(() {
            listData = [];
          });
          UserApi().collectSongList().then((v) {
            if (v.result == 100) {
              setState(() {
                listData = v.data!.mlist;
              });
            } else {
              listData = [];
            }
          });
        },
        onIconTap: <T>(T i) {
          if (i is Mlist) {
            SongListApi().collect(i.dissid, 2).then((v) {
              if (v.result == 100) {
                getData();
              }
            });
          }
        },
      ),
      TabConfig(
        id: 3,
        name: '专辑',
        idKey: 'albumid',
        imgKey: 'pic',
        titleKey: 'albumname',
        subTileKey: 'singername',
        onTab: (TabConfig i) async {
          setState(() {
            listData = [];
          });
          UserApi().collectAlbum().then((v) {
            if (v.result == 100) {
              setState(() {
                listData = v.data!.mlist;
              });
            } else {
              listData = [];
            }
          });
        },
        onIconTap: <MListBase>(MListBase i) {},
      ),
      TabConfig(
        id: 4,
        name: '视频',
        idKey: 'id',
        imgKey: 'mv_picurl',
        titleKey: 'mv_name',
        subTileKey: 'singer_name',
        onTab: (TabConfig i) async {
          setState(() {
            listData = [];
          });
          UserApi().collectMv().then((v) {
            if (v.result == 100) {
              setState(() {
                listData = v.data!.mlist;
              });
            } else {
              listData = [];
            }
          });
        },
        onIconTap: <MListBase>(MListBase i) {},
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: 30,
          children:
              tabConfig
                  .map(
                    (i) => ZText(
                      text: i.name,
                      hoverColor: ICON_STYLE.hoverColor,
                      color:
                          active == i.id ? ICON_STYLE.hoverColor : Colors.black,
                      onTap: () async {
                        await i.onTab(i);
                        setState(() {
                          active = i.id;
                        });
                      },
                    ),
                  )
                  .toList(),
        ),
        SizedBox(height: 30),
        active != 1
            ? ItemGridView<MListBase>(
              data: listData,
              idKey: tabConfig[active - 1].idKey,
              imgKey: tabConfig[active - 1].imgKey,
              titleKey: tabConfig[active - 1].titleKey,
              subTileKey: tabConfig[active - 1].subTileKey,
              minCrossAxisCount: active == 4 ? 3 : 4,
              childAspectRatio: active == 4 ? 1.2 : 0.7,
              imageAspectRatio: active == 4 ? 0.55 : 1,
              onIconTap: tabConfig[active - 1].onIconTap,
            )
            : MyMusicSong(data: musicData),
      ],
    );
  }
}
