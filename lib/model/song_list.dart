class SongList {
  late int result;
  Data? data;
  String? errMsg;

  SongList({required this.result, this.data, this.errMsg});

  SongList.fromJson(Map<String, dynamic> json) {
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

  static List<SongList> fromList(List<Map<String, dynamic>> list) {
    return list.map(SongList.fromJson).toList();
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
  late Creator creator;

  Data({required this.mlist, required this.creator});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["mlist"] is List) {
      mlist =
          (json["mlist"] == null
              ? null
              : (json["mlist"] as List)
                  .map((e) => Mlist.fromJson(e))
                  .toList())!;
    }
    if (json["creator"] is Map) {
      creator =
          (json["creator"] == null ? null : Creator.fromJson(json["creator"]))!;
    }
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["mlist"] = mlist.map((e) => e.toJson()).toList();
    _data["creator"] = creator.toJson();
    return _data;
  }
}

class Creator {
  late String hostuin;
  late String encryptUin;
  late String hostname;

  Creator({
    required this.hostuin,
    required this.encryptUin,
    required this.hostname,
  });

  Creator.fromJson(Map<String, dynamic> json) {
    if (json["hostuin"] is String) {
      hostuin = json["hostuin"];
    }
    if (json["encrypt_uin"] is String) {
      encryptUin = json["encrypt_uin"];
    }
    if (json["hostname"] is String) {
      hostname = json["hostname"];
    }
  }

  static List<Creator> fromList(List<Map<String, dynamic>> list) {
    return list.map(Creator.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["hostuin"] = hostuin;
    _data["encrypt_uin"] = encryptUin;
    _data["hostname"] = hostname;
    return _data;
  }
}

class Mlist {
  late String dissName;
  late String dissCover;
  late int songCnt;
  late int listenNum;
  late int dirid;
  late int tid;
  late int dirShow;

  Mlist({
    required this.dissName,
    required this.dissCover,
    required this.songCnt,
    required this.listenNum,
    required this.dirid,
    required this.tid,
    required this.dirShow,
  });

  Mlist.fromJson(Map<String, dynamic> json) {
    if (json["diss_name"] is String) {
      dissName = json["diss_name"];
    }
    if (json["diss_cover"] is String) {
      dissCover = json["diss_cover"];
    }
    if (json["song_cnt"] is int) {
      songCnt = json["song_cnt"];
    }
    if (json["listen_num"] is int) {
      listenNum = json["listen_num"];
    }
    if (json["dirid"] is int) {
      dirid = json["dirid"];
    }
    if (json["tid"] is int) {
      tid = json["tid"];
    }
    if (json["dir_show"] is int) {
      dirShow = json["dir_show"];
    }
  }

  static List<Mlist> fromList(List<Map<String, dynamic>> list) {
    return list.map(Mlist.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["diss_name"] = dissName;
    _data["diss_cover"] = dissCover;
    _data["song_cnt"] = songCnt;
    _data["listen_num"] = listenNum;
    _data["dirid"] = dirid;
    _data["tid"] = tid;
    _data["dir_show"] = dirShow;
    return _data;
  }
}
