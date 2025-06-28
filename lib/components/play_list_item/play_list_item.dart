/*
 * @author: hongyun
 * @since: 2025-06-26
 * play_list_item.dart
*/
import 'dart:math' as math show pi;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qqmusic/api/song_list/song_list.dart';
import 'package:qqmusic/bloc/music_bloc.dart';
import 'package:qqmusic/components/z_icon/z_icon.dart';
import 'package:qqmusic/const/icon-style.dart' show ICON_STYLE;
import 'package:qqmusic/model/song/song.dart' as Song;
import 'package:qqmusic/model/songlist/collect_song.dart';
import 'package:qqmusic/tools/get_display_text.dart'
    show createIdentificationIcon;
import 'package:qqmusic/tools/music_img_url.dart';

class PlayListItem extends StatefulWidget {
  const PlayListItem({
    super.key,
    required this.listData,
    required this.dirinfo,
  });
  final List<Songlist> listData;
  final Dirinfo dirinfo;

  @override
  State<PlayListItem> createState() => _PlayListItemState();
}

class _PlayListItemState extends State<PlayListItem> {
  late MusicBloc _musicBloc;
  Color color = Colors.white;
  int mouseEnterActive = -1;
  int mouseClickActive = -1;
  int curActive = 0;
  int curClick = 0;

  @override
  void initState() {
    // TODO: implement initState
    _musicBloc = context.read<MusicBloc>();
    super.initState();
  }

  void onTapFavorite(Songlist data) {
    SongListApi().remove(widget.dirinfo.dirid, data.id).then((v) {
      if (v.result == 100) {
        _musicBloc.add(ReloadRequestMusicEvent(true));
      }
    });
  }

  /// 生成 TextSpan 列表
  List<Text> joinSingerName(List<Singer> singer) {
    int length = singer.length + (singer.length - 1);
    List<Singer> data = [];
    for (var i = 0; i < length; i++) {
      if (i % 2 == 0) {
        data.add(singer[(i / 2).floor()]);
      } else {
        data.add(Singer(id: 0, mid: '0', name: '/', title: '/'));
      }
    }
    return data
        .map(
          (v) => Text(
            v.title,
            style: TextStyle(color: Color.fromRGBO(100, 100, 100, 1.0)),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children:
          widget.listData
              .asMap()
              .entries
              .map(
                (data) => GestureDetector(
                  onTap: () {
                    setState(() {
                      mouseClickActive = data.value.id;
                      // isClick = true;
                      color = Color.fromRGBO(230, 230, 230, 1.0);
                    });
                  },
                  child: MouseRegion(
                    onEnter: (event) {
                      setState(() {
                        mouseEnterActive = data.value.id;
                        color = Color.fromRGBO(248, 248, 248, 1.0);
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        mouseEnterActive = -1;
                        if (curClick == curActive) {
                          color = Color.fromRGBO(230, 230, 230, 1.0);
                        } else {
                          color = Colors.white;
                        }
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      padding: EdgeInsets.all(9),
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color:
                            mouseEnterActive == data.value.id
                                ? Color.fromRGBO(248, 248, 248, 1.0)
                                : mouseClickActive == data.value.id
                                ? Color.fromRGBO(230, 230, 230, 1.0)
                                : (data.key % 2 == 0)
                                ? Color.fromRGBO(250, 250, 250, 1.0)
                                : Colors.white,
                        // border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          // 封面
                          Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Image(
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    getMusicImageUrl(
                                      Song.TrackInfo.fromJson(
                                        data.value.toJson(),
                                      ),
                                    ),
                                  ),
                                ),
                                if (mouseClickActive == data.value.id ||
                                    mouseEnterActive == data.value.id)
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(0, 0, 0, 0.4),
                                    ),
                                    child: Center(
                                      child: ZIcon(
                                        icon: Icons.play_arrow_rounded,
                                        color: Colors.white,
                                        hoverColor: ICON_STYLE.hoverColor,
                                        size: 28,
                                        onTap: () {
                                          context.read<MusicBloc>().add(
                                            CurrentMusicStateEvent(data.value),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          // 标题歌手
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  spacing: 5,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        data.value.title,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    ...createIdentificationIcon(data.value),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: joinSingerName(data.value.singer),
                                ),
                              ],
                            ),
                          ),
                          // 操作图标
                          if (mouseClickActive == data.value.id ||
                              mouseEnterActive == data.value.id)
                            Row(
                              spacing: 5,
                              children: [
                                ZIcon(
                                  icon: Icons.favorite_rounded,
                                  color: Color.fromRGBO(255, 106, 106, 1.0),
                                  hoverColor: Color.fromRGBO(244, 85, 85, 1.0),
                                  message: '取消喜欢',
                                  size: 22,
                                  onTap: () {
                                    onTapFavorite(data.value);
                                  },
                                ),
                                Transform.rotate(
                                  angle: math.pi / 1.5,
                                  child: ZIcon(
                                    icon: Icons.attachment_rounded,
                                    color: Color.fromRGBO(96, 96, 96, 1.0),
                                    hoverColor: ICON_STYLE.hoverColor,
                                    size: 22,
                                    message: '定位',
                                  ),
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
                                    size: 17,
                                    message: '更多',
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
    );
  }
}
