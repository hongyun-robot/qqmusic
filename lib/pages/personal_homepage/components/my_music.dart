/*
 * @author: hongyun
 * @since: 2025-06-10
 * my_music.dart
*/
import 'package:flutter/material.dart';
import 'package:qqmusic/api/user/user.dart' show UserApi;
import 'package:qqmusic/components/item_grid_view/item_grid_view.dart';
import 'package:qqmusic/components/z_text/z_text.dart';
import 'package:qqmusic/const/icon-style.dart' show ICON_STYLE;
import 'package:qqmusic/model/collect_song_list.dart' as CollectSongList;
import 'package:qqmusic/pages/personal_homepage/components/model/tab_config.dart';

class MyMusic extends StatefulWidget {
  const MyMusic({super.key});

  @override
  State<MyMusic> createState() => _MyMusicState();
}

class _MyMusicState extends State<MyMusic> {
  int active = 2;
  late final List<TabConfig> tabConfig;
  List<CollectSongList.Mlist> collectSongList = [];

  @override
  void initState() {
    super.initState();
    UserApi().collectSongList().then((v) {
      if (v.result == 100) {
        setState(() {
          collectSongList = v.data!.mlist;
        });
      } else {
        collectSongList = [];
      }
    });
    tabConfig = [
      TabConfig.fromJson({'id': 1, 'name': '歌曲'}),
      TabConfig.fromJson({'id': 2, 'name': '歌单'}),
      TabConfig.fromJson({'id': 3, 'name': '专辑'}),
      TabConfig.fromJson({'id': 4, 'name': '视频'}),
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
                      onTap: () {
                        setState(() {
                          active = i.id;
                        });
                      },
                    ),
                  )
                  .toList(),
        ),
        SizedBox(height: 30),
        ItemGridView<CollectSongList.Mlist>(
          data: collectSongList,
          idKey: 'dissid',
          imgKey: 'logo',
          titleKey: 'dissname',
          subTileKey: 'nickname',
        ),
      ],
    );
  }
}
