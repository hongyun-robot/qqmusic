import 'package:flutter/material.dart';

final DEFAULT_ICON_COLOR = Color.fromRGBO(173, 173, 173, 1.0);
final DISABLE_ICON_COLOR = Color.fromRGBO(196, 196, 196, 1.0);
final PRIMARY_ICON_COLOR = Color.fromRGBO(0, 235, 129, 1.0);

final PRIMARY_COLOR = Color.fromRGBO(233, 233, 233, 1.0);
final PRIMARY_ACTIVE_COLOR = Color.fromRGBO(216, 216, 216, 1.0);

enum ROUTER_NAME {
  recommend(name: 'recommend', explain: '推荐'),
  musichall(name: 'MusicHall', explain: '乐馆'),
  like(name: 'like', explain: '喜欢'),
  recently(name: 'recently', explain: '最近播放'),
  localdownload(name: 'LocalDownload', explain: '本地和下载'),
  purchased(name: 'purchased', explain: '已购音乐'),
  triallistening(name: 'TrialListening', explain: '试听列表'),
  personalhomepage(name: 'PersonalHomepage', explain: '个人主页');

  const ROUTER_NAME({required this.name, required this.explain});
  final String name;
  final String explain;
}
