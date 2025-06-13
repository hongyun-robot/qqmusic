import 'package:qqmusic/model/m_list_base.dart' show MListBase;

class TabConfig {
  late int id;
  late String name;
  late String idKey;
  late String imgKey;
  late String titleKey;
  late String subTileKey;
  late Future Function(TabConfig i) onTab;
  late void Function(MListBase i) onIconTap;

  TabConfig({
    required this.id,
    required this.name,
    required this.idKey,
    required this.imgKey,
    required this.titleKey,
    required this.subTileKey,
    required this.onTab,
    required this.onIconTap,
  });

  TabConfig.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["idKey"] is String) {
      idKey = json["idKey"];
    }
    if (json["imgKey"] is String) {
      imgKey = json["imgKey"];
    }
    if (json["titleKey"] is String) {
      titleKey = json["titleKey"];
    }
    if (json["subTileKey"] is String) {
      subTileKey = json["subTileKey"];
    }
    onTab = json["onTab"];
    onIconTap = json["onIconTap"];
  }

  static List<TabConfig> fromList(List<Map<String, dynamic>> list) {
    return list.map(TabConfig.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["idKey"] = idKey;
    _data["imgKey"] = imgKey;
    _data["titleKey"] = titleKey;
    _data["subTileKey"] = subTileKey;
    _data["onTab"] = onTab;
    _data["onIconTap"] = onIconTap;
    return _data;
  }
}
