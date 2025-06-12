import 'package:qqmusic/model/m_list_base.dart' show MListBase;

class AlbumList {
  late int result;
  Data? data;
  String? errMsg;

  AlbumList({required this.result, this.data, this.errMsg});

  AlbumList.fromJson(Map<String, dynamic> json) {
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

  static List<AlbumList> fromList(List<Map<String, dynamic>> list) {
    return list.map(AlbumList.fromJson).toList();
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
  late int albumid;
  late String albummid;
  late String albumname;
  late int singerid;
  late String singermid;
  late String singername;
  late List<Singer> singer;
  late String pic;
  late int songnum;
  late int pubtime;
  late int status;
  late int ordertime;

  Mlist({
    required this.albumid,
    required this.albummid,
    required this.albumname,
    required this.singerid,
    required this.singermid,
    required this.singername,
    required this.singer,
    required this.pic,
    required this.songnum,
    required this.pubtime,
    required this.status,
    required this.ordertime,
  });

  Mlist.fromJson(Map<String, dynamic> json) {
    if (json["albumid"] is int) {
      albumid = json["albumid"];
    }
    if (json["albummid"] is String) {
      albummid = json["albummid"];
    }
    if (json["albumname"] is String) {
      albumname = json["albumname"];
    }
    if (json["singerid"] is int) {
      singerid = json["singerid"];
    }
    if (json["singermid"] is String) {
      singermid = json["singermid"];
    }
    if (json["singername"] is String) {
      singername = json["singername"];
    }
    if (json["singer"] is List) {
      singer =
          (json["singer"] == null
              ? null
              : (json["singer"] as List)
                  .map((e) => Singer.fromJson(e))
                  .toList())!;
    }
    if (json["pic"] is String) {
      pic = json["pic"];
    }
    if (json["songnum"] is int) {
      songnum = json["songnum"];
    }
    if (json["pubtime"] is int) {
      pubtime = json["pubtime"];
    }
    if (json["status"] is int) {
      status = json["status"];
    }
    if (json["ordertime"] is int) {
      ordertime = json["ordertime"];
    }
  }

  static List<Mlist> fromList(List<Map<String, dynamic>> list) {
    return list.map(Mlist.fromJson).toList();
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["albumid"] = albumid;
    _data["albummid"] = albummid;
    _data["albumname"] = albumname;
    _data["singerid"] = singerid;
    _data["singermid"] = singermid;
    _data["singername"] = singername;
    if (singer != null) {
      _data["singer"] = singer?.map((e) => e.toJson()).toList();
    }
    _data["pic"] = pic;
    _data["songnum"] = songnum;
    _data["pubtime"] = pubtime;
    _data["status"] = status;
    _data["ordertime"] = ordertime;
    return _data;
  }
}

class Singer {
  late String mid;
  late String name;

  Singer({required this.mid, required this.name});

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
