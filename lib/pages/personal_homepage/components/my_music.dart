/*
 * @author: hongyun
 * @since: 2025-06-10
 * my_music.dart
*/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qqmusic/api/song_list/song_list.dart';
import 'package:qqmusic/api/user/user.dart' show UserApi;
import 'package:qqmusic/bloc/scroll_bloc.dart';
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
import 'package:qqmusic/tools/func_utils.dart';

class MyMusic extends StatefulWidget {
  const MyMusic({super.key});

  @override
  State<MyMusic> createState() => _MyMusicState();
}

class _MyMusicState extends State<MyMusic> {
  int active = 1;
  int dissid = 0;
  bool isRequest = true;
  int song_begin = 0;
  int song_num = 30;
  int songMaxNum = -1;
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

  void getMusicData() {
    SongListApi().collectSong(dissid, song_begin, song_num).then((v) {
      if (v.result == 100) {
        List<Songlist> data = v.data!.req1.data!.songlist;
        songMaxNum = v.data!.req1.data!.totalSongNum;
        if ((musicData.length + data.length) >= songMaxNum) {
          isRequest = false;
        } else {
          isRequest = true;
        }
        // if ()
        setState(() {
          musicData.addAll(data);
        });
      }
    });
  }

  @override
  void initState() {
    _userState = context.read<UserBloc>().state;
    ScrollState scrollState = context.read<ScrollBloc>().state;

    if (_userState is UserLoaded) {
      dissid = int.parse(
        (_userState as UserLoaded).userInfo.data!.mymusic[0].id,
      );
    }
    getMusicData();

    if (scrollState is ScrollInitial) {
      if (scrollState.controller != null) {
        // FunctionProxy listener = FunctionProxy(, timeout: 1000);
        scrollState.controller!.addListener(() {
          final double maxPixels =
              scrollState.controller!.position.maxScrollExtent;
          if (isRequest && scrollState.controller!.offset >= maxPixels - 200) {
            isRequest = false;
            print('request data');
            song_begin += song_num;
            getMusicData();
          }
        });
      }
    }
    tabConfig = [
      TabConfig(
        id: 1,
        name: '歌曲',
        idKey: '',
        imgKey: '',
        titleKey: '',
        subTileKey: '',
        onTab: (TabConfig i) async {
          if (songMaxNum >= musicData.length) return;
          getMusicData();
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
          getData();
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

    super.initState();
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
