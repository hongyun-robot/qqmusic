import 'package:flutter/material.dart'
    show Color, EdgeInsets, SystemMouseCursors, Widget;
import 'package:qqmusic/components/text_icon/text_icon.dart';
import 'package:qqmusic/const/icon-style.dart' show ICON_STYLE;
import 'package:qqmusic/model/songlist/collect_song.dart' show Songlist;
import 'package:qqmusic/tools/is_vip.dart';

/// 判断音乐品质没有返回 ''
String getMusicQualityText(Songlist data) {
  final isDolby = data.file.sizeDolby != 0;
  if (isDolby) return '杜比';
  final isMASTER = data.file.sizeNew![0] != 0;
  if (isMASTER) return '臻品母带';
  final isATMOS_2 = data.file.sizeNew![1] != 0;
  if (isATMOS_2) return '全景声';
  final isATMOS_51 = data.file.sizeNew![2] != 0;
  if (isATMOS_51) return '臻品音质';
  return '';
}

/// 创建图标，包括是否为VIP、音乐品质、是否有MV
List<Widget> createIdentificationIcon(Songlist data) {
  List<Widget> listWidget = [];
  final isVip = isVIP(data);
  if (isVip) {
    listWidget.add(
      TextIcon(
        icon: 'VIP',
        color: ICON_STYLE.hoverColor,
        padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
        size: 8,
        cursor: SystemMouseCursors.basic,
      ),
    );
  }
  final musicQuality = getMusicQualityText(data);
  if (musicQuality != '') {
    listWidget.add(
      TextIcon(
        icon: musicQuality,
        color: Color.fromRGBO(232, 189, 101, 1.0),
        padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
        size: 8,
        cursor: SystemMouseCursors.basic,
      ),
    );
  }
  final isMV = data.mv.vid != '';
  if (isMV) {
    listWidget.add(
      TextIcon(
        icon: 'MV',
        color: Color.fromRGBO(123, 123, 123, 1.0),
        padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
        size: 8,
      ),
    );
  }
  return listWidget;
}
