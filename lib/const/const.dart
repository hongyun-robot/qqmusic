import 'package:flutter/material.dart';

final DEFAULT_COLOR = Color.fromRGBO(173, 173, 173, 1.0);
final PRIMARY_COLOR = Color.fromRGBO(0, 235, 129, 1.0);

enum ROUTER_NAME {
  recommend(name: 'recommend', explain: '推荐'),
  musichall(name: 'musichall', explain: '乐馆'),
  like(name: 'like', explain: '我的喜欢');

  const ROUTER_NAME({required this.name, required this.explain});
  final String name;
  final String explain;
}
