class CollectSonglist {
  late int result;
  Data? data;
  String? errMsg;

  CollectSonglist({required this.result, this.errMsg, this.data});

  CollectSonglist.fromJson(Map<String, dynamic> json) {
    if (json["result"] is int) {
      result = json["result"];
    }
    if (json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
    if (json["errMsg"] is String) {
      errMsg = json["errMsg"];
    }
  }

  static List<CollectSonglist> fromList(List<Map<String, dynamic>> list) {
    return list.map(CollectSonglist.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["result"] = result;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    _data["errMsg"] = errMsg;
    return _data;
  }
}

class Data {
  late int code;
  late int ts;
  late int startTs;
  late String traceid;
  late Req1 req1;

  Data({
    required this.code,
    required this.ts,
    required this.startTs,
    required this.traceid,
    required this.req1,
  });

  Data.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["ts"] is int) {
      ts = json["ts"];
    }
    if (json["start_ts"] is int) {
      startTs = json["start_ts"];
    }
    if (json["traceid"] is String) {
      traceid = json["traceid"];
    }
    if (json["req_1"] is Map) {
      req1 = (json["req_1"] == null ? null : Req1.fromJson(json["req_1"]))!;
    }
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["ts"] = ts;
    _data["start_ts"] = startTs;
    _data["traceid"] = traceid;
    if (req1 != null) {
      _data["req_1"] = req1?.toJson();
    }
    return _data;
  }
}

class Req1 {
  late int code;
  Data1? data;

  Req1({required this.code, this.data});

  Req1.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["data"] is Map) {
      data = json["data"] == null ? null : Data1.fromJson(json["data"]);
    }
  }

  static List<Req1> fromList(List<Map<String, dynamic>> list) {
    return list.map(Req1.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data1 {
  String? reason;
  int? result;
  List<dynamic>? vFailedPlaylistId;

  Data1({this.reason, this.result, this.vFailedPlaylistId});

  Data1.fromJson(Map<String, dynamic> json) {
    if (json["reason"] is String) {
      reason = json["reason"];
    }
    if (json["result"] is int) {
      result = json["result"];
    }
    if (json["v_failedPlaylistId"] is List) {
      vFailedPlaylistId = json["v_failedPlaylistId"] ?? [];
    }
  }

  static List<Data1> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data1.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["reason"] = reason;
    _data["result"] = result;
    if (vFailedPlaylistId != null) {
      _data["v_failedPlaylistId"] = vFailedPlaylistId;
    }
    return _data;
  }
}
