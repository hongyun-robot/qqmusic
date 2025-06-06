class CollectSongList {
  late int result;
  Data? data;
  String? errMsg;

  CollectSongList({required this.result, this.data, this.errMsg});

  CollectSongList.fromJson(Map<String, dynamic> json) {
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

  static List<CollectSongList> fromList(List<Map<String, dynamic>> list) {
    return list.map(CollectSongList.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["result"] = result;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  late List<Mlist> mlist;
  late int total;
  late int pageNo;
  late String pageSize;

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
    if (json["pageSize"] is String) {
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

class Mlist {
  late int dissid;
  late String dissname;
  late int songnum;
  late int listennum;
  late String logo;
  late int dirid;
  late int dirtype;
  late int isshow;
  late int dirShow;
  late int uin;
  late String encryptUin;
  late String nickname;
  late int createtime;
  late int type;

  Mlist({
    required this.dissid,
    required this.dissname,
    required this.songnum,
    required this.listennum,
    required this.logo,
    required this.dirid,
    required this.dirtype,
    required this.isshow,
    required this.dirShow,
    required this.uin,
    required this.encryptUin,
    required this.nickname,
    required this.createtime,
    required this.type,
  });

  Mlist.fromJson(Map<String, dynamic> json) {
    if (json["dissid"] is int) {
      dissid = json["dissid"];
    }
    if (json["dissname"] is String) {
      dissname = json["dissname"];
    }
    if (json["songnum"] is int) {
      songnum = json["songnum"];
    }
    if (json["listennum"] is int) {
      listennum = json["listennum"];
    }
    if (json["logo"] is String) {
      logo = json["logo"];
    }
    if (json["dirid"] is int) {
      dirid = json["dirid"];
    }
    if (json["dirtype"] is int) {
      dirtype = json["dirtype"];
    }
    if (json["isshow"] is int) {
      isshow = json["isshow"];
    }
    if (json["dir_show"] is int) {
      dirShow = json["dir_show"];
    }
    if (json["uin"] is int) {
      uin = json["uin"];
    }
    if (json["encrypt_uin"] is String) {
      encryptUin = json["encrypt_uin"];
    }
    if (json["nickname"] is String) {
      nickname = json["nickname"];
    }
    if (json["createtime"] is int) {
      createtime = json["createtime"];
    }
    if (json["type"] is int) {
      type = json["type"];
    }
  }

  static List<Mlist> fromList(List<Map<String, dynamic>> list) {
    return list.map(Mlist.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["dissid"] = dissid;
    _data["dissname"] = dissname;
    _data["songnum"] = songnum;
    _data["listennum"] = listennum;
    _data["logo"] = logo;
    _data["dirid"] = dirid;
    _data["dirtype"] = dirtype;
    _data["isshow"] = isshow;
    _data["dir_show"] = dirShow;
    _data["uin"] = uin;
    _data["encrypt_uin"] = encryptUin;
    _data["nickname"] = nickname;
    _data["createtime"] = createtime;
    _data["type"] = type;
    return _data;
  }
}
