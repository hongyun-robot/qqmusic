/*
 * @author: hongyun
 * @since: 2025-06-10
 * my_radio.dart
*/
import 'package:flutter/material.dart';

class MyRadio extends StatelessWidget {
  const MyRadio({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        spacing: 34,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://y.qq.com/mediastyle/yqq/img/symbol_none.png?max_age=2592000',
          ),
          SelectableText('还没有上传过视频', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
