class TabConfig {
  late int id;
  late String name;

  TabConfig({required this.id, required this.name});

  TabConfig.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
  }

  static List<TabConfig> fromList(List<Map<String, dynamic>> list) {
    return list.map(TabConfig.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    return _data;
  }
}
