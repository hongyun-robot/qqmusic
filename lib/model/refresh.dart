class Refresh {
  late int result;
  String? errMsg;
  Data? data;

  Refresh({required this.result, this.errMsg, this.data});

  Refresh.fromJson(Map<String, dynamic> json) {
    if (json["result"] is int) {
      result = json["result"];
    }
    if (json["errMsg"] is String) {
      errMsg = json["errMsg"];
    }
    if (json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
  }

  static List<Refresh> fromList(List<Map<String, dynamic>> list) {
    return list.map(Refresh.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["result"] = result;
    _data["errMsg"] = errMsg;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  late String musickey;

  Data({required this.musickey});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["musickey"] is String) {
      musickey = json["musickey"];
    }
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["musickey"] = musickey;
    return _data;
  }
}
