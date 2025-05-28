/*
 * @author: hongyun
 * @since: 2025-05-28
 * player.dart
*/
import 'package:flutter/material.dart';

class Player extends StatelessWidget {
  const Player({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 0, 25, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: const Image(
                    width: 50,
                    height: 50,
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/demo/song_pic.webp'),
                  ),
                ),
                SizedBox(width: 11),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [Text('淋雨一直走'), Text('-'), Text('张韶涵')]),
                    Row(
                      spacing: 22.0,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.favorite_rounded, color: Colors.red),
                        Icon(Icons.comment_rounded),
                        Icon(Icons.more_horiz_rounded),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // repeat_one_rounded
                    // refresh
                    Icon(Icons.repeat_rounded),
                    SizedBox(width: 42),
                    Icon(Icons.favorite_rounded, color: Colors.red),
                    SizedBox(width: 25),
                    // pause
                    Icon(Icons.play_arrow_rounded),
                    SizedBox(width: 25),
                    Icon(Icons.last_page_rounded),
                    SizedBox(width: 42),
                    Icon(Icons.volume_down_rounded),
                  ],
                ),
                Row(
                  children: [
                    Text('00:00'),
                    SizedBox(width: 8),
                    Flexible(
                      child: Container(color: Colors.blueGrey, height: 3),
                    ),
                    SizedBox(width: 10),
                    Text('03:24'),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.favorite_rounded, color: Colors.red),
                SizedBox(width: 21),
                Icon(Icons.favorite_rounded, color: Colors.red),
                SizedBox(width: 21),
                Icon(Icons.favorite_rounded, color: Colors.red),
                SizedBox(width: 24),
                Icon(Icons.favorite_rounded, color: Colors.red),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
