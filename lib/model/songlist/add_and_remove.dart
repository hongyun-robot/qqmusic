class AddAndRemove {
  String? message;
  late int result;
  Data? data;

  AddAndRemove({this.message, required this.result, this.data});

  AddAndRemove.fromJson(Map<String, dynamic> json) {
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["result"] is int) {
      result = json["result"];
    }
    if (json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
  }

  static List<AddAndRemove> fromList(List<Map<String, dynamic>> list) {
    return list.map(AddAndRemove.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    _data["result"] = result;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
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
  late Data1 data;

  Req1({required this.code, required this.data});

  Req1.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["data"] is Map) {
      data = (json["data"] == null ? null : Data1.fromJson(json["data"]))!;
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
  late String msg;
  late Result result;
  late int retCode;

  Data1({required this.msg, required this.result, required this.retCode});

  Data1.fromJson(Map<String, dynamic> json) {
    if (json["msg"] is String) {
      msg = json["msg"];
    }
    if (json["result"] is Map) {
      result =
          (json["result"] == null ? null : Result.fromJson(json["result"]))!;
    }
    if (json["retCode"] is int) {
      retCode = json["retCode"];
    }
  }

  static List<Data1> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data1.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["msg"] = msg;
    if (result != null) {
      _data["result"] = result?.toJson();
    }
    _data["retCode"] = retCode;
    return _data;
  }
}

class Result {
  late String dirDesc;
  late int dirId;
  late String dirName;
  late String dirPicUrl;
  late List<Songlist> songlist;
  late int tid;
  late int updateTime;

  Result({
    required this.dirDesc,
    required this.dirId,
    required this.dirName,
    required this.dirPicUrl,
    required this.songlist,
    required this.tid,
    required this.updateTime,
  });

  Result.fromJson(Map<String, dynamic> json) {
    if (json["dirDesc"] is String) {
      dirDesc = json["dirDesc"];
    }
    if (json["dirId"] is int) {
      dirId = json["dirId"];
    }
    if (json["dirName"] is String) {
      dirName = json["dirName"];
    }
    if (json["dirPicUrl"] is String) {
      dirPicUrl = json["dirPicUrl"];
    }
    if (json["songlist"] is List) {
      songlist =
          (json["songlist"] == null
              ? null
              : (json["songlist"] as List)
                  .map((e) => Songlist.fromJson(e))
                  .toList())!;
    }
    if (json["tid"] is int) {
      tid = json["tid"];
    }
    if (json["updateTime"] is int) {
      updateTime = json["updateTime"];
    }
  }

  static List<Result> fromList(List<Map<String, dynamic>> list) {
    return list.map(Result.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["dirDesc"] = dirDesc;
    _data["dirId"] = dirId;
    _data["dirName"] = dirName;
    _data["dirPicUrl"] = dirPicUrl;
    if (songlist != null) {
      _data["songlist"] = songlist?.map((e) => e.toJson()).toList();
    }
    _data["tid"] = tid;
    _data["updateTime"] = updateTime;
    return _data;
  }
}

class Songlist {
  late int backendSongId;
  late int loc;
  late int songId;
  late int songType;
  late String songUrl;

  Songlist({
    required this.backendSongId,
    required this.loc,
    required this.songId,
    required this.songType,
    required this.songUrl,
  });

  Songlist.fromJson(Map<String, dynamic> json) {
    if (json["backendSongId"] is int) {
      backendSongId = json["backendSongId"];
    }
    if (json["loc"] is int) {
      loc = json["loc"];
    }
    if (json["songId"] is int) {
      songId = json["songId"];
    }
    if (json["songType"] is int) {
      songType = json["songType"];
    }
    if (json["songUrl"] is String) {
      songUrl = json["songUrl"];
    }
  }

  static List<Songlist> fromList(List<Map<String, dynamic>> list) {
    return list.map(Songlist.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["backendSongId"] = backendSongId;
    _data["loc"] = loc;
    _data["songId"] = songId;
    _data["songType"] = songType;
    _data["songUrl"] = songUrl;
    return _data;
  }
}
