/*
 * @author: hongyun
 * @since: 2025-06-10
 * my_music.dart
*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:qqmusic/api/song_list/song_list.dart';
import 'package:qqmusic/api/user/user.dart' show UserApi;
import 'package:qqmusic/bloc/music_bloc.dart';
import 'package:qqmusic/bloc/scroll_bloc.dart';
import 'package:qqmusic/bloc/user_bloc.dart';
import 'package:qqmusic/components/item_grid_view/item_grid_view.dart';
import 'package:qqmusic/components/z_text/z_text.dart';
import 'package:qqmusic/const/icon-style.dart' show ICON_STYLE;
import 'package:qqmusic/model/collect_song_list.dart' show Mlist;
import 'package:qqmusic/model/m_list_base.dart' show MListBase;
import 'package:qqmusic/model/song/song.dart' show TrackInfo;
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
  late MusicBloc _musicBloc;
  int active = 1;
  int dissid = 0;

  /// 是否重新请求数据
  bool isReloadRequest = false;

  /// 是否下拉请求数据
  bool isRequest = true;
  int song_begin = 0;
  int song_num = 30;
  int songMaxNum = -1;
  late final List<TabConfig> tabConfig;
  List<MListBase> listData = [];
  List<Songlist> musicData = [];
  Dirinfo? dirinfo;
  TrackInfo? currentPlayMusic;
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

  Future<bool> getMusicData() async {
    final v = await SongListApi().collectSong(dissid, song_begin, song_num);
    if (v.result == 100) {
      dirinfo = v.data!.req1.data.dirinfo;
      List<Songlist> data = v.data!.req1.data.songlist;
      songMaxNum = v.data!.req1.data.totalSongNum;
      if ((musicData.length + data.length) >= songMaxNum) {
        isRequest = false;
      } else {
        isRequest = true;
      }
      if (isReloadRequest) {
        isReloadRequest = false;
        setState(() {
          musicData = data;
        });
      } else {
        setState(() {
          musicData.addAll(data);
        });
      }
      return true;
    }
    return false;
  }

  @override
  void initState() {
    _userState = context.read<UserBloc>().state;
    _musicBloc = context.read<MusicBloc>();
    ScrollState scrollState = context.read<ScrollBloc>().state;

    if (_userState is UserLoaded) {
      dissid = int.parse(
        (_userState as UserLoaded).userInfo.data!.mymusic[0].id,
      );
    }
    getMusicData();

    if (scrollState is ScrollInitial) {
      if (scrollState.controller != null) {
        scrollState.controller!.addListener(() {
          final double maxPixels =
              scrollState.controller!.position.maxScrollExtent;
          if (isRequest && scrollState.controller!.offset >= maxPixels - 200) {
            isRequest = false;
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
    return BlocListener<MusicBloc, MusicState>(
      listenWhen:
          (previous, current) =>
              current is ReloadRequestMusicState ||
              current is CurrentMusicInfoState,
      listener: (context, state) async {
        if (state is ReloadRequestMusicState) {
          if (state.isReloadRequest) {
            isReloadRequest = true;
            song_begin = 0;
            final isSuccess = await getMusicData();
            if (isSuccess) {
              _musicBloc.add(
                CurrentPlayListEvent(listData: musicData, dirinfo: dirinfo!),
              );
              // _musicBloc.add(CurrentPlayListInIndexState(curMusicInIndex: ));
              _musicBloc.add(ReloadRequestMusicEvent(false));
            }
          }
        }

        if (state is CurrentMusicInfoState) {
          currentPlayMusic = state.data.data!.trackInfo;
          _musicBloc.add(
            CurrentPlayListEvent(dirinfo: dirinfo!, listData: musicData),
          );
          _musicBloc.add(
            CurrentPlayListInIndexEvent(
              musicData.indexWhere(
                (v) => v.id == state.data.data!.trackInfo.id,
              ),
            ),
          );
        }
      },
      child: Column(
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
                            active == i.id
                                ? ICON_STYLE.hoverColor
                                : Colors.black,
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
              : MyMusicSong(data: musicData, dirinfo: dirinfo),
        ],
      ),
    );
  }
}
