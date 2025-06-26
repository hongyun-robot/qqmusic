/*
 * @author: hongyun
 * @since: 2025-06-26
 * play_list_item.dart
*/
import 'package:flutter/material.dart';
import 'package:qqmusic/model/song/song.dart' as Song;
import 'package:qqmusic/model/songlist/collect_song.dart';
import 'package:qqmusic/tools/music_img_url.dart';

class PlayListItem extends StatefulWidget {
  const PlayListItem({super.key, required this.listData});
  final List<Songlist> listData;

  @override
  State<PlayListItem> createState() => _PlayListItemState();
}

class _PlayListItemState extends State<PlayListItem> {
  Color color = Colors.white;
  int curActive = 0;
  int curClick = 0;

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
                      curClick = data.value.id;
                      // isClick = true;
                      color = Color.fromRGBO(230, 230, 230, 1.0);
                    });
                  },
                  child: MouseRegion(
                    onEnter: (event) {
                      setState(() {
                        curActive = data.value.id;
                        color = Color.fromRGBO(248, 248, 248, 1.0);
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        if (curClick == curActive) {
                          color = Color.fromRGBO(230, 230, 230, 1.0);
                        } else {
                          color = Colors.white;
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(9),
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color:
                            (data.key % 2 == 0)
                                ? Color.fromRGBO(250, 250, 250, 1.0)
                                : Colors.white,
                        // border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: Image(
                              width: 40,
                              height: 40,
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                getMusicImageUrl(
                                  Song.TrackInfo.fromJson(data.value.toJson()),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.value.title,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: joinSingerName(data.value.singer),
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
