import 'package:qqmusic/model/m_list_base.dart' show MListBase;

class MvList {
  late int result;
  Data? data;
  String? errMsg;

  MvList({required this.result, this.data, this.errMsg});

  MvList.fromJson(Map<String, dynamic> json) {
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

  static List<MvList> fromList(List<Map<String, dynamic>> list) {
    return list.map(MvList.fromJson).toList();
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
  late List<Mlist> mlist;
  late int total;
  late int pageNo;
  late int pageSize;

  Data({
    required this.mlist,
    required this.total,
    required this.pageNo,
    required this.pageSize,
  });

  Data.fromJson(Map<String, dynamic> json) {
    if (json["mlist"] is List) {
      mlist =
          (json["mlist"] == null
              ? null
              : (json["mlist"] as List)
                  .map((e) => Mlist.fromJson(e))
                  .toList())!;
    }
    if (json["total"] is int) {
      total = json["total"];
    }
    if (json["pageNo"] is int) {
      pageNo = json["pageNo"];
    }
    if (json["pageSize"] is int) {
      pageSize = json["pageSize"];
    }
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["mlist"] = mlist.map((e) => e.toJson()).toList();
    _data["total"] = total;
    _data["pageNo"] = pageNo;
    _data["pageSize"] = pageSize;
    return _data;
  }
}

class Mlist extends MListBase {
  late String mid;
  late int type;
  late int id;
  late int time;
  late int status;
  late String vid;
  late String mvName;
  late String singerMid;
  late int singerId;
  late String singerName;
  late List<Singer> singer;
  late String uploaderEncuin;
  late String uploaderNick;
  late String mvPicurl;
  late int publishDate;
  late int playcount;

  Mlist({
    required this.mid,
    required this.type,
    required this.id,
    required this.time,
    required this.status,
    required this.vid,
    required this.mvName,
    required this.singerMid,
    required this.singerId,
    required this.singerName,
    required this.singer,
    required this.uploaderEncuin,
    required this.uploaderNick,
    required this.mvPicurl,
    required this.publishDate,
    required this.playcount,
  });

  Mlist.fromJson(Map<String, dynamic> json) {
    if (json["mid"] is String) {
      mid = json["mid"];
    }
    if (json["type"] is int) {
      type = json["type"];
    }
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["time"] is int) {
      time = json["time"];
    }
    if (json["status"] is int) {
      status = json["status"];
    }
    if (json["vid"] is String) {
      vid = json["vid"];
    }
    if (json["mv_name"] is String) {
      mvName = json["mv_name"];
    }
    if (json["singer_mid"] is String) {
      singerMid = json["singer_mid"];
    }
    if (json["singer_id"] is int) {
      singerId = json["singer_id"];
    }
    if (json["singer_name"] is String) {
      singerName = json["singer_name"];
    }
    if (json["singer"] is List) {
      singer =
          (json["singer"] == null
              ? null
              : (json["singer"] as List)
                  .map((e) => Singer.fromJson(e))
                  .toList())!;
    }
    if (json["uploader_encuin"] is String) {
      uploaderEncuin = json["uploader_encuin"];
    }
    if (json["uploader_nick"] is String) {
      uploaderNick = json["uploader_nick"];
    }
    if (json["mv_picurl"] is String) {
      mvPicurl = json["mv_picurl"];
    }
    if (json["publish_date"] is int) {
      publishDate = json["publish_date"];
    }
    if (json["playcount"] is int) {
      playcount = json["playcount"];
    }
  }

  static List<Mlist> fromList(List<Map<String, dynamic>> list) {
    return list.map(Mlist.fromJson).toList();
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["mid"] = mid;
    _data["type"] = type;
    _data["id"] = id;
    _data["time"] = time;
    _data["status"] = status;
    _data["vid"] = vid;
    _data["mv_name"] = mvName;
    _data["singer_mid"] = singerMid;
    _data["singer_id"] = singerId;
    _data["singer_name"] = singerName;
    if (singer != null) {
      _data["singer"] = singer?.map((e) => e.toJson()).toList();
    }
    _data["uploader_encuin"] = uploaderEncuin;
    _data["uploader_nick"] = uploaderNick;
    _data["mv_picurl"] = mvPicurl;
    _data["publish_date"] = publishDate;
    _data["playcount"] = playcount;
    return _data;
  }
}

class Singer {
  String? mid;
  String? name;

  Singer({this.mid, this.name});

  Singer.fromJson(Map<String, dynamic> json) {
    if (json["mid"] is String) {
      mid = json["mid"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
  }

  static List<Singer> fromList(List<Map<String, dynamic>> list) {
    return list.map(Singer.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["mid"] = mid;
    _data["name"] = name;
    return _data;
  }
}
