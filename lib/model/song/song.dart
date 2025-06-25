class Song {
  late int result;
  Data? data;
  String? errMsg;

  Song({required this.result, this.errMsg, this.data});

  Song.fromJson(Map<String, dynamic> json) {
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

  static List<Song> fromList(List<Map<String, dynamic>> list) {
    return list.map(Song.fromJson).toList();
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
  late Info info;
  late Extras extras;
  late TrackInfo trackInfo;

  Data({required this.info, required this.extras, required this.trackInfo});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["info"] is Map) {
      info = (json["info"] == null ? null : Info.fromJson(json["info"]))!;
    }
    if (json["extras"] is Map) {
      extras =
          (json["extras"] == null ? null : Extras.fromJson(json["extras"]))!;
    }
    if (json["track_info"] is Map) {
      trackInfo =
          (json["track_info"] == null
              ? null
              : TrackInfo.fromJson(json["track_info"]))!;
    }
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["info"] = info.toJson();
    _data["extras"] = extras.toJson();
    _data["track_info"] = trackInfo.toJson();
    return _data;
  }
}

class TrackInfo {
  late int id;
  late int type;
  late String mid;
  late String name;
  late String title;
  late String subtitle;
  late List<Singer> singer;
  late Album album;
  late Mv mv;
  late int interval;
  late int isonly;
  late int language;
  late int genre;
  late int indexCd;
  late int indexAlbum;
  late String timePublic;
  late int status;
  late int fnote;
  late File file;
  late Pay pay;
  late Action action;
  late Ksong ksong;
  late Volume volume;
  late String label;
  late String url;
  late int bpm;
  late int version;
  late String trace;
  late int dataType;
  late int modifyStamp;
  late String pingpong;
  late String ppurl;
  late int tid;
  late int ov;
  late int sa;
  late String es;
  late List<String> vs;
  late List<int> vi;
  late String ktag;
  late List<num> vf;

  TrackInfo({
    required this.id,
    required this.type,
    required this.mid,
    required this.name,
    required this.title,
    required this.subtitle,
    required this.singer,
    required this.album,
    required this.mv,
    required this.interval,
    required this.isonly,
    required this.language,
    required this.genre,
    required this.indexCd,
    required this.indexAlbum,
    required this.timePublic,
    required this.status,
    required this.fnote,
    required this.file,
    required this.pay,
    required this.action,
    required this.ksong,
    required this.volume,
    required this.label,
    required this.url,
    required this.bpm,
    required this.version,
    required this.trace,
    required this.dataType,
    required this.modifyStamp,
    required this.pingpong,
    required this.ppurl,
    required this.tid,
    required this.ov,
    required this.sa,
    required this.es,
    required this.vs,
    required this.vi,
    required this.ktag,
    required this.vf,
  });

  TrackInfo.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["type"] is int) {
      type = json["type"];
    }
    if (json["mid"] is String) {
      mid = json["mid"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["subtitle"] is String) {
      subtitle = json["subtitle"];
    }
    if (json["singer"] is List) {
      singer =
          (json["singer"] == null
              ? null
              : (json["singer"] as List)
                  .map((e) => Singer.fromJson(e))
                  .toList())!;
    }
    if (json["album"] is Map) {
      album = (json["album"] == null ? null : Album.fromJson(json["album"]))!;
    }
    if (json["mv"] is Map) {
      mv = (json["mv"] == null ? null : Mv.fromJson(json["mv"]))!;
    }
    if (json["interval"] is int) {
      interval = json["interval"];
    }
    if (json["isonly"] is int) {
      isonly = json["isonly"];
    }
    if (json["language"] is int) {
      language = json["language"];
    }
    if (json["genre"] is int) {
      genre = json["genre"];
    }
    if (json["index_cd"] is int) {
      indexCd = json["index_cd"];
    }
    if (json["index_album"] is int) {
      indexAlbum = json["index_album"];
    }
    if (json["time_public"] is String) {
      timePublic = json["time_public"];
    }
    if (json["status"] is int) {
      status = json["status"];
    }
    if (json["fnote"] is int) {
      fnote = json["fnote"];
    }
    if (json["file"] is Map) {
      file = (json["file"] == null ? null : File.fromJson(json["file"]))!;
    }
    if (json["pay"] is Map) {
      pay = (json["pay"] == null ? null : Pay.fromJson(json["pay"]))!;
    }
    if (json["action"] is Map) {
      action =
          (json["action"] == null ? null : Action.fromJson(json["action"]))!;
    }
    if (json["ksong"] is Map) {
      ksong = (json["ksong"] == null ? null : Ksong.fromJson(json["ksong"]))!;
    }
    if (json["volume"] is Map) {
      volume =
          (json["volume"] == null ? null : Volume.fromJson(json["volume"]))!;
    }
    if (json["label"] is String) {
      label = json["label"];
    }
    if (json["url"] is String) {
      url = json["url"];
    }
    if (json["bpm"] is int) {
      bpm = json["bpm"];
    }
    if (json["version"] is int) {
      version = json["version"];
    }
    if (json["trace"] is String) {
      trace = json["trace"];
    }
    if (json["data_type"] is int) {
      dataType = json["data_type"];
    }
    if (json["modify_stamp"] is int) {
      modifyStamp = json["modify_stamp"];
    }
    if (json["pingpong"] is String) {
      pingpong = json["pingpong"];
    }
    if (json["ppurl"] is String) {
      ppurl = json["ppurl"];
    }
    if (json["tid"] is int) {
      tid = json["tid"];
    }
    if (json["ov"] is int) {
      ov = json["ov"];
    }
    if (json["sa"] is int) {
      sa = json["sa"];
    }
    if (json["es"] is String) {
      es = json["es"];
    }
    if (json["vs"] is List) {
      vs = (json["vs"] == null ? null : List<String>.from(json["vs"]))!;
    }
    if (json["vi"] is List) {
      vi = (json["vi"] == null ? null : List<int>.from(json["vi"]))!;
    }
    if (json["ktag"] is String) {
      ktag = json["ktag"];
    }
    if (json["vf"] is List) {
      vf = (json["vf"] == null ? null : List<num>.from(json["vf"]))!;
    }
  }

  static List<TrackInfo> fromList(List<Map<String, dynamic>> list) {
    return list.map(TrackInfo.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["type"] = type;
    _data["mid"] = mid;
    _data["name"] = name;
    _data["title"] = title;
    _data["subtitle"] = subtitle;
    _data["singer"] = singer.map((e) => e.toJson()).toList();
    _data["album"] = album.toJson();
    _data["mv"] = mv.toJson();
    _data["interval"] = interval;
    _data["isonly"] = isonly;
    _data["language"] = language;
    _data["genre"] = genre;
    _data["index_cd"] = indexCd;
    _data["index_album"] = indexAlbum;
    _data["time_public"] = timePublic;
    _data["status"] = status;
    _data["fnote"] = fnote;
    _data["file"] = file.toJson();
    _data["pay"] = pay.toJson();
    _data["action"] = action.toJson();
    _data["ksong"] = ksong.toJson();
    _data["volume"] = volume.toJson();
    _data["label"] = label;
    _data["url"] = url;
    _data["bpm"] = bpm;
    _data["version"] = version;
    _data["trace"] = trace;
    _data["data_type"] = dataType;
    _data["modify_stamp"] = modifyStamp;
    _data["pingpong"] = pingpong;
    _data["ppurl"] = ppurl;
    _data["tid"] = tid;
    _data["ov"] = ov;
    _data["sa"] = sa;
    _data["es"] = es;
    _data["vs"] = vs;
    _data["vi"] = vi;
    _data["ktag"] = ktag;
    _data["vf"] = vf;
    return _data;
  }
}

class Volume {
  late double gain;
  late int peak;
  late double lra;

  Volume({required this.gain, required this.peak, required this.lra});

  Volume.fromJson(Map<String, dynamic> json) {
    if (json["gain"] is double) {
      gain = json["gain"];
    }
    if (json["peak"] is int) {
      peak = json["peak"];
    }
    if (json["lra"] is double) {
      lra = json["lra"];
    }
  }

  static List<Volume> fromList(List<Map<String, dynamic>> list) {
    return list.map(Volume.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["gain"] = gain;
    _data["peak"] = peak;
    _data["lra"] = lra;
    return _data;
  }
}

class Ksong {
  late int id;
  late String mid;

  Ksong({required this.id, required this.mid});

  Ksong.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["mid"] is String) {
      mid = json["mid"];
    }
  }

  static List<Ksong> fromList(List<Map<String, dynamic>> list) {
    return list.map(Ksong.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["mid"] = mid;
    return _data;
  }
}

class Action {
  late int msgid;
  late int alert;
  late int icons;
  late int msgshare;
  late int msgfav;
  late int msgdown;
  late int msgpay;
  late int switch2;
  late int icon2;
  late int mswitch;

  Action({
    required this.msgid,
    required this.alert,
    required this.icons,
    required this.msgshare,
    required this.msgfav,
    required this.msgdown,
    required this.msgpay,
    required this.switch2,
    required this.icon2,
    required this.mswitch,
  });

  Action.fromJson(Map<String, dynamic> json) {
    if (json["msgid"] is int) {
      msgid = json["msgid"];
    }
    if (json["alert"] is int) {
      alert = json["alert"];
    }
    if (json["icons"] is int) {
      icons = json["icons"];
    }
    if (json["msgshare"] is int) {
      msgshare = json["msgshare"];
    }
    if (json["msgfav"] is int) {
      msgfav = json["msgfav"];
    }
    if (json["msgdown"] is int) {
      msgdown = json["msgdown"];
    }
    if (json["msgpay"] is int) {
      msgpay = json["msgpay"];
    }
    if (json["switch2"] is int) {
      switch2 = json["switch2"];
    }
    if (json["icon2"] is int) {
      icon2 = json["icon2"];
    }
    if (json["mswitch"] is int) {
      mswitch = json["mswitch"];
    }
  }

  static List<Action> fromList(List<Map<String, dynamic>> list) {
    return list.map(Action.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["msgid"] = msgid;
    _data["alert"] = alert;
    _data["icons"] = icons;
    _data["msgshare"] = msgshare;
    _data["msgfav"] = msgfav;
    _data["msgdown"] = msgdown;
    _data["msgpay"] = msgpay;
    _data["switch2"] = switch2;
    _data["icon2"] = icon2;
    _data["mswitch"] = mswitch;
    return _data;
  }
}

class Pay {
  late int payMonth;
  late int priceTrack;
  late int priceAlbum;
  late int payPlay;
  late int payDown;
  late int payStatus;
  late int timeFree;

  Pay({
    required this.payMonth,
    required this.priceTrack,
    required this.priceAlbum,
    required this.payPlay,
    required this.payDown,
    required this.payStatus,
    required this.timeFree,
  });

  Pay.fromJson(Map<String, dynamic> json) {
    if (json["pay_month"] is int) {
      payMonth = json["pay_month"];
    }
    if (json["price_track"] is int) {
      priceTrack = json["price_track"];
    }
    if (json["price_album"] is int) {
      priceAlbum = json["price_album"];
    }
    if (json["pay_play"] is int) {
      payPlay = json["pay_play"];
    }
    if (json["pay_down"] is int) {
      payDown = json["pay_down"];
    }
    if (json["pay_status"] is int) {
      payStatus = json["pay_status"];
    }
    if (json["time_free"] is int) {
      timeFree = json["time_free"];
    }
  }

  static List<Pay> fromList(List<Map<String, dynamic>> list) {
    return list.map(Pay.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["pay_month"] = payMonth;
    _data["price_track"] = priceTrack;
    _data["price_album"] = priceAlbum;
    _data["pay_play"] = payPlay;
    _data["pay_down"] = payDown;
    _data["pay_status"] = payStatus;
    _data["time_free"] = timeFree;
    return _data;
  }
}

class File {
  late String mediaMid;
  late int size24Aac;
  late int size48Aac;
  late int size96Aac;
  late int size192Ogg;
  late int size192Aac;
  late int size128Mp3;
  late int size320Mp3;
  late int sizeApe;
  late int sizeFlac;
  late int sizeDts;
  late int sizeTry;
  late int tryBegin;
  late int tryEnd;
  late String url;
  late int sizeHires;
  late int hiresSample;
  late int hiresBitdepth;
  late int b30S;
  late int e30S;
  late int size96Ogg;
  late List<dynamic> size360Ra;
  late int sizeDolby;
  late List<int> sizeNew;

  File({
    required this.mediaMid,
    required this.size24Aac,
    required this.size48Aac,
    required this.size96Aac,
    required this.size192Ogg,
    required this.size192Aac,
    required this.size128Mp3,
    required this.size320Mp3,
    required this.sizeApe,
    required this.sizeFlac,
    required this.sizeDts,
    required this.sizeTry,
    required this.tryBegin,
    required this.tryEnd,
    required this.url,
    required this.sizeHires,
    required this.hiresSample,
    required this.hiresBitdepth,
    required this.b30S,
    required this.e30S,
    required this.size96Ogg,
    required this.size360Ra,
    required this.sizeDolby,
    required this.sizeNew,
  });

  File.fromJson(Map<String, dynamic> json) {
    if (json["media_mid"] is String) {
      mediaMid = json["media_mid"];
    }
    if (json["size_24aac"] is int) {
      size24Aac = json["size_24aac"];
    }
    if (json["size_48aac"] is int) {
      size48Aac = json["size_48aac"];
    }
    if (json["size_96aac"] is int) {
      size96Aac = json["size_96aac"];
    }
    if (json["size_192ogg"] is int) {
      size192Ogg = json["size_192ogg"];
    }
    if (json["size_192aac"] is int) {
      size192Aac = json["size_192aac"];
    }
    if (json["size_128mp3"] is int) {
      size128Mp3 = json["size_128mp3"];
    }
    if (json["size_320mp3"] is int) {
      size320Mp3 = json["size_320mp3"];
    }
    if (json["size_ape"] is int) {
      sizeApe = json["size_ape"];
    }
    if (json["size_flac"] is int) {
      sizeFlac = json["size_flac"];
    }
    if (json["size_dts"] is int) {
      sizeDts = json["size_dts"];
    }
    if (json["size_try"] is int) {
      sizeTry = json["size_try"];
    }
    if (json["try_begin"] is int) {
      tryBegin = json["try_begin"];
    }
    if (json["try_end"] is int) {
      tryEnd = json["try_end"];
    }
    if (json["url"] is String) {
      url = json["url"];
    }
    if (json["size_hires"] is int) {
      sizeHires = json["size_hires"];
    }
    if (json["hires_sample"] is int) {
      hiresSample = json["hires_sample"];
    }
    if (json["hires_bitdepth"] is int) {
      hiresBitdepth = json["hires_bitdepth"];
    }
    if (json["b_30s"] is int) {
      b30S = json["b_30s"];
    }
    if (json["e_30s"] is int) {
      e30S = json["e_30s"];
    }
    if (json["size_96ogg"] is int) {
      size96Ogg = json["size_96ogg"];
    }
    if (json["size_360ra"] is List) {
      size360Ra = json["size_360ra"] ?? [];
    }
    if (json["size_dolby"] is int) {
      sizeDolby = json["size_dolby"];
    }
    if (json["size_new"] is List) {
      sizeNew =
          (json["size_new"] == null ? null : List<int>.from(json["size_new"]))!;
    }
  }

  static List<File> fromList(List<Map<String, dynamic>> list) {
    return list.map(File.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["media_mid"] = mediaMid;
    _data["size_24aac"] = size24Aac;
    _data["size_48aac"] = size48Aac;
    _data["size_96aac"] = size96Aac;
    _data["size_192ogg"] = size192Ogg;
    _data["size_192aac"] = size192Aac;
    _data["size_128mp3"] = size128Mp3;
    _data["size_320mp3"] = size320Mp3;
    _data["size_ape"] = sizeApe;
    _data["size_flac"] = sizeFlac;
    _data["size_dts"] = sizeDts;
    _data["size_try"] = sizeTry;
    _data["try_begin"] = tryBegin;
    _data["try_end"] = tryEnd;
    _data["url"] = url;
    _data["size_hires"] = sizeHires;
    _data["hires_sample"] = hiresSample;
    _data["hires_bitdepth"] = hiresBitdepth;
    _data["b_30s"] = b30S;
    _data["e_30s"] = e30S;
    _data["size_96ogg"] = size96Ogg;
    _data["size_360ra"] = size360Ra;
    _data["size_dolby"] = sizeDolby;
    _data["size_new"] = sizeNew;
    return _data;
  }
}

class Mv {
  late int id;
  late String vid;
  late String name;
  late String title;
  late int vt;

  Mv({
    required this.id,
    required this.vid,
    required this.name,
    required this.title,
    required this.vt,
  });

  Mv.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["vid"] is String) {
      vid = json["vid"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["vt"] is int) {
      vt = json["vt"];
    }
  }

  static List<Mv> fromList(List<Map<String, dynamic>> list) {
    return list.map(Mv.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["vid"] = vid;
    _data["name"] = name;
    _data["title"] = title;
    _data["vt"] = vt;
    return _data;
  }
}

class Album {
  late int id;
  late String mid;
  late String name;
  late String title;
  late String subtitle;
  late String timePublic;
  late String pmid;

  Album({
    required this.id,
    required this.mid,
    required this.name,
    required this.title,
    required this.subtitle,
    required this.timePublic,
    required this.pmid,
  });

  Album.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["mid"] is String) {
      mid = json["mid"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["subtitle"] is String) {
      subtitle = json["subtitle"];
    }
    if (json["time_public"] is String) {
      timePublic = json["time_public"];
    }
    if (json["pmid"] is String) {
      pmid = json["pmid"];
    }
  }

  static List<Album> fromList(List<Map<String, dynamic>> list) {
    return list.map(Album.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["mid"] = mid;
    _data["name"] = name;
    _data["title"] = title;
    _data["subtitle"] = subtitle;
    _data["time_public"] = timePublic;
    _data["pmid"] = pmid;
    return _data;
  }
}

class Singer {
  late int id;
  late String mid;
  late String name;
  late String title;
  late int type;
  late int uin;

  Singer({
    required this.id,
    required this.mid,
    required this.name,
    required this.title,
    required this.type,
    required this.uin,
  });

  Singer.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["mid"] is String) {
      mid = json["mid"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["type"] is int) {
      type = json["type"];
    }
    if (json["uin"] is int) {
      uin = json["uin"];
    }
  }

  static List<Singer> fromList(List<Map<String, dynamic>> list) {
    return list.map(Singer.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["mid"] = mid;
    _data["name"] = name;
    _data["title"] = title;
    _data["type"] = type;
    _data["uin"] = uin;
    return _data;
  }
}

class Extras {
  late String name;
  late String transname;
  late String subtitle;
  late String from;
  late String wikiurl;

  Extras({
    required this.name,
    required this.transname,
    required this.subtitle,
    required this.from,
    required this.wikiurl,
  });

  Extras.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["transname"] is String) {
      transname = json["transname"];
    }
    if (json["subtitle"] is String) {
      subtitle = json["subtitle"];
    }
    if (json["from"] is String) {
      from = json["from"];
    }
    if (json["wikiurl"] is String) {
      wikiurl = json["wikiurl"];
    }
  }

  static List<Extras> fromList(List<Map<String, dynamic>> list) {
    return list.map(Extras.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["transname"] = transname;
    _data["subtitle"] = subtitle;
    _data["from"] = from;
    _data["wikiurl"] = wikiurl;
    return _data;
  }
}

class Info {
  late Company company;
  late Genre genre;
  late Intro intro;
  late Lan lan;
  late PubTime pubTime;

  Info({
    required this.company,
    required this.genre,
    required this.intro,
    required this.lan,
    required this.pubTime,
  });

  Info.fromJson(Map<String, dynamic> json) {
    if (json["company"] is Map) {
      company =
          (json["company"] == null ? null : Company.fromJson(json["company"]))!;
    }
    if (json["genre"] is Map) {
      genre = (json["genre"] == null ? null : Genre.fromJson(json["genre"]))!;
    }
    if (json["intro"] is Map) {
      intro = (json["intro"] == null ? null : Intro.fromJson(json["intro"]))!;
    }
    if (json["lan"] is Map) {
      lan = (json["lan"] == null ? null : Lan.fromJson(json["lan"]))!;
    }
    if (json["pub_time"] is Map) {
      pubTime =
          (json["pub_time"] == null
              ? null
              : PubTime.fromJson(json["pub_time"]))!;
    }
  }

  static List<Info> fromList(List<Map<String, dynamic>> list) {
    return list.map(Info.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["company"] = company.toJson();
    _data["genre"] = genre.toJson();
    _data["intro"] = intro.toJson();
    _data["lan"] = lan.toJson();
    _data["pub_time"] = pubTime.toJson();
    return _data;
  }
}

class PubTime {
  late String title;
  late String type;
  late List<Content4> content;
  late int pos;
  late int more;
  late String selected;
  late int usePlatform;

  PubTime({
    required this.title,
    required this.type,
    required this.content,
    required this.pos,
    required this.more,
    required this.selected,
    required this.usePlatform,
  });

  PubTime.fromJson(Map<String, dynamic> json) {
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["content"] is List) {
      content =
          (json["content"] == null
              ? null
              : (json["content"] as List)
                  .map((e) => Content4.fromJson(e))
                  .toList())!;
    }
    if (json["pos"] is int) {
      pos = json["pos"];
    }
    if (json["more"] is int) {
      more = json["more"];
    }
    if (json["selected"] is String) {
      selected = json["selected"];
    }
    if (json["use_platform"] is int) {
      usePlatform = json["use_platform"];
    }
  }

  static List<PubTime> fromList(List<Map<String, dynamic>> list) {
    return list.map(PubTime.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["type"] = type;
    _data["content"] = content.map((e) => e.toJson()).toList();
    _data["pos"] = pos;
    _data["more"] = more;
    _data["selected"] = selected;
    _data["use_platform"] = usePlatform;
    return _data;
  }
}

class Content4 {
  late int id;
  late String value;
  late String mid;
  late int type;
  late int showType;
  late int isParent;
  late String picurl;
  late int readCnt;
  late String author;
  late String jumpurl;
  late String oriPicurl;

  Content4({
    required this.id,
    required this.value,
    required this.mid,
    required this.type,
    required this.showType,
    required this.isParent,
    required this.picurl,
    required this.readCnt,
    required this.author,
    required this.jumpurl,
    required this.oriPicurl,
  });

  Content4.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["value"] is String) {
      value = json["value"];
    }
    if (json["mid"] is String) {
      mid = json["mid"];
    }
    if (json["type"] is int) {
      type = json["type"];
    }
    if (json["show_type"] is int) {
      showType = json["show_type"];
    }
    if (json["is_parent"] is int) {
      isParent = json["is_parent"];
    }
    if (json["picurl"] is String) {
      picurl = json["picurl"];
    }
    if (json["read_cnt"] is int) {
      readCnt = json["read_cnt"];
    }
    if (json["author"] is String) {
      author = json["author"];
    }
    if (json["jumpurl"] is String) {
      jumpurl = json["jumpurl"];
    }
    if (json["ori_picurl"] is String) {
      oriPicurl = json["ori_picurl"];
    }
  }

  static List<Content4> fromList(List<Map<String, dynamic>> list) {
    return list.map(Content4.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["value"] = value;
    _data["mid"] = mid;
    _data["type"] = type;
    _data["show_type"] = showType;
    _data["is_parent"] = isParent;
    _data["picurl"] = picurl;
    _data["read_cnt"] = readCnt;
    _data["author"] = author;
    _data["jumpurl"] = jumpurl;
    _data["ori_picurl"] = oriPicurl;
    return _data;
  }
}

class Lan {
  late String title;
  late String type;
  late List<Content3> content;
  late int pos;
  late int more;
  late String selected;
  late int usePlatform;

  Lan({
    required this.title,
    required this.type,
    required this.content,
    required this.pos,
    required this.more,
    required this.selected,
    required this.usePlatform,
  });

  Lan.fromJson(Map<String, dynamic> json) {
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["content"] is List) {
      content =
          (json["content"] == null
              ? null
              : (json["content"] as List)
                  .map((e) => Content3.fromJson(e))
                  .toList())!;
    }
    if (json["pos"] is int) {
      pos = json["pos"];
    }
    if (json["more"] is int) {
      more = json["more"];
    }
    if (json["selected"] is String) {
      selected = json["selected"];
    }
    if (json["use_platform"] is int) {
      usePlatform = json["use_platform"];
    }
  }

  static List<Lan> fromList(List<Map<String, dynamic>> list) {
    return list.map(Lan.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["type"] = type;
    _data["content"] = content.map((e) => e.toJson()).toList();
    _data["pos"] = pos;
    _data["more"] = more;
    _data["selected"] = selected;
    _data["use_platform"] = usePlatform;
    return _data;
  }
}

class Content3 {
  late int id;
  late String value;
  late String mid;
  late int type;
  late int showType;
  late int isParent;
  late String picurl;
  late int readCnt;
  late String author;
  late String jumpurl;
  late String oriPicurl;

  Content3({
    required this.id,
    required this.value,
    required this.mid,
    required this.type,
    required this.showType,
    required this.isParent,
    required this.picurl,
    required this.readCnt,
    required this.author,
    required this.jumpurl,
    required this.oriPicurl,
  });

  Content3.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["value"] is String) {
      value = json["value"];
    }
    if (json["mid"] is String) {
      mid = json["mid"];
    }
    if (json["type"] is int) {
      type = json["type"];
    }
    if (json["show_type"] is int) {
      showType = json["show_type"];
    }
    if (json["is_parent"] is int) {
      isParent = json["is_parent"];
    }
    if (json["picurl"] is String) {
      picurl = json["picurl"];
    }
    if (json["read_cnt"] is int) {
      readCnt = json["read_cnt"];
    }
    if (json["author"] is String) {
      author = json["author"];
    }
    if (json["jumpurl"] is String) {
      jumpurl = json["jumpurl"];
    }
    if (json["ori_picurl"] is String) {
      oriPicurl = json["ori_picurl"];
    }
  }

  static List<Content3> fromList(List<Map<String, dynamic>> list) {
    return list.map(Content3.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["value"] = value;
    _data["mid"] = mid;
    _data["type"] = type;
    _data["show_type"] = showType;
    _data["is_parent"] = isParent;
    _data["picurl"] = picurl;
    _data["read_cnt"] = readCnt;
    _data["author"] = author;
    _data["jumpurl"] = jumpurl;
    _data["ori_picurl"] = oriPicurl;
    return _data;
  }
}

class Intro {
  late String title;
  late String type;
  late List<Content2> content;
  late int pos;
  late int more;
  late String selected;
  late int usePlatform;

  Intro({
    required this.title,
    required this.type,
    required this.content,
    required this.pos,
    required this.more,
    required this.selected,
    required this.usePlatform,
  });

  Intro.fromJson(Map<String, dynamic> json) {
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["content"] is List) {
      content =
          (json["content"] == null
              ? null
              : (json["content"] as List)
                  .map((e) => Content2.fromJson(e))
                  .toList())!;
    }
    if (json["pos"] is int) {
      pos = json["pos"];
    }
    if (json["more"] is int) {
      more = json["more"];
    }
    if (json["selected"] is String) {
      selected = json["selected"];
    }
    if (json["use_platform"] is int) {
      usePlatform = json["use_platform"];
    }
  }

  static List<Intro> fromList(List<Map<String, dynamic>> list) {
    return list.map(Intro.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["type"] = type;
    _data["content"] = content.map((e) => e.toJson()).toList();
    _data["pos"] = pos;
    _data["more"] = more;
    _data["selected"] = selected;
    _data["use_platform"] = usePlatform;
    return _data;
  }
}

class Content2 {
  late int id;
  late String value;
  late String mid;
  late int type;
  late int showType;
  late int isParent;
  late String picurl;
  late int readCnt;
  late String author;
  late String jumpurl;
  late String oriPicurl;

  Content2({
    required this.id,
    required this.value,
    required this.mid,
    required this.type,
    required this.showType,
    required this.isParent,
    required this.picurl,
    required this.readCnt,
    required this.author,
    required this.jumpurl,
    required this.oriPicurl,
  });

  Content2.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["value"] is String) {
      value = json["value"];
    }
    if (json["mid"] is String) {
      mid = json["mid"];
    }
    if (json["type"] is int) {
      type = json["type"];
    }
    if (json["show_type"] is int) {
      showType = json["show_type"];
    }
    if (json["is_parent"] is int) {
      isParent = json["is_parent"];
    }
    if (json["picurl"] is String) {
      picurl = json["picurl"];
    }
    if (json["read_cnt"] is int) {
      readCnt = json["read_cnt"];
    }
    if (json["author"] is String) {
      author = json["author"];
    }
    if (json["jumpurl"] is String) {
      jumpurl = json["jumpurl"];
    }
    if (json["ori_picurl"] is String) {
      oriPicurl = json["ori_picurl"];
    }
  }

  static List<Content2> fromList(List<Map<String, dynamic>> list) {
    return list.map(Content2.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["value"] = value;
    _data["mid"] = mid;
    _data["type"] = type;
    _data["show_type"] = showType;
    _data["is_parent"] = isParent;
    _data["picurl"] = picurl;
    _data["read_cnt"] = readCnt;
    _data["author"] = author;
    _data["jumpurl"] = jumpurl;
    _data["ori_picurl"] = oriPicurl;
    return _data;
  }
}

class Genre {
  late String title;
  late String type;
  late List<Content1> content;
  late int pos;
  late int more;
  late String selected;
  late int usePlatform;

  Genre({
    required this.title,
    required this.type,
    required this.content,
    required this.pos,
    required this.more,
    required this.selected,
    required this.usePlatform,
  });

  Genre.fromJson(Map<String, dynamic> json) {
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["content"] is List) {
      content =
          (json["content"] == null
              ? null
              : (json["content"] as List)
                  .map((e) => Content1.fromJson(e))
                  .toList())!;
    }
    if (json["pos"] is int) {
      pos = json["pos"];
    }
    if (json["more"] is int) {
      more = json["more"];
    }
    if (json["selected"] is String) {
      selected = json["selected"];
    }
    if (json["use_platform"] is int) {
      usePlatform = json["use_platform"];
    }
  }

  static List<Genre> fromList(List<Map<String, dynamic>> list) {
    return list.map(Genre.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["type"] = type;
    _data["content"] = content.map((e) => e.toJson()).toList();
    _data["pos"] = pos;
    _data["more"] = more;
    _data["selected"] = selected;
    _data["use_platform"] = usePlatform;
    return _data;
  }
}

class Content1 {
  late int id;
  late String value;
  late String mid;
  late int type;
  late int showType;
  late int isParent;
  late String picurl;
  late int readCnt;
  late String author;
  late String jumpurl;
  late String oriPicurl;

  Content1({
    required this.id,
    required this.value,
    required this.mid,
    required this.type,
    required this.showType,
    required this.isParent,
    required this.picurl,
    required this.readCnt,
    required this.author,
    required this.jumpurl,
    required this.oriPicurl,
  });

  Content1.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["value"] is String) {
      value = json["value"];
    }
    if (json["mid"] is String) {
      mid = json["mid"];
    }
    if (json["type"] is int) {
      type = json["type"];
    }
    if (json["show_type"] is int) {
      showType = json["show_type"];
    }
    if (json["is_parent"] is int) {
      isParent = json["is_parent"];
    }
    if (json["picurl"] is String) {
      picurl = json["picurl"];
    }
    if (json["read_cnt"] is int) {
      readCnt = json["read_cnt"];
    }
    if (json["author"] is String) {
      author = json["author"];
    }
    if (json["jumpurl"] is String) {
      jumpurl = json["jumpurl"];
    }
    if (json["ori_picurl"] is String) {
      oriPicurl = json["ori_picurl"];
    }
  }

  static List<Content1> fromList(List<Map<String, dynamic>> list) {
    return list.map(Content1.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["value"] = value;
    _data["mid"] = mid;
    _data["type"] = type;
    _data["show_type"] = showType;
    _data["is_parent"] = isParent;
    _data["picurl"] = picurl;
    _data["read_cnt"] = readCnt;
    _data["author"] = author;
    _data["jumpurl"] = jumpurl;
    _data["ori_picurl"] = oriPicurl;
    return _data;
  }
}

class Company {
  late String title;
  late String type;
  late List<Content> content;
  late int pos;
  late int more;
  late String selected;
  late int usePlatform;

  Company({
    required this.title,
    required this.type,
    required this.content,
    required this.pos,
    required this.more,
    required this.selected,
    required this.usePlatform,
  });

  Company.fromJson(Map<String, dynamic> json) {
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["content"] is List) {
      content =
          (json["content"] == null
              ? null
              : (json["content"] as List)
                  .map((e) => Content.fromJson(e))
                  .toList())!;
    }
    if (json["pos"] is int) {
      pos = json["pos"];
    }
    if (json["more"] is int) {
      more = json["more"];
    }
    if (json["selected"] is String) {
      selected = json["selected"];
    }
    if (json["use_platform"] is int) {
      usePlatform = json["use_platform"];
    }
  }

  static List<Company> fromList(List<Map<String, dynamic>> list) {
    return list.map(Company.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["type"] = type;
    _data["content"] = content.map((e) => e.toJson()).toList();
    _data["pos"] = pos;
    _data["more"] = more;
    _data["selected"] = selected;
    _data["use_platform"] = usePlatform;
    return _data;
  }
}

class Content {
  late int id;
  late String value;
  late String mid;
  late int type;
  late int showType;
  late int isParent;
  late String picurl;
  late int readCnt;
  late String author;
  late String jumpurl;
  late String oriPicurl;

  Content({
    required this.id,
    required this.value,
    required this.mid,
    required this.type,
    required this.showType,
    required this.isParent,
    required this.picurl,
    required this.readCnt,
    required this.author,
    required this.jumpurl,
    required this.oriPicurl,
  });

  Content.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["value"] is String) {
      value = json["value"];
    }
    if (json["mid"] is String) {
      mid = json["mid"];
    }
    if (json["type"] is int) {
      type = json["type"];
    }
    if (json["show_type"] is int) {
      showType = json["show_type"];
    }
    if (json["is_parent"] is int) {
      isParent = json["is_parent"];
    }
    if (json["picurl"] is String) {
      picurl = json["picurl"];
    }
    if (json["read_cnt"] is int) {
      readCnt = json["read_cnt"];
    }
    if (json["author"] is String) {
      author = json["author"];
    }
    if (json["jumpurl"] is String) {
      jumpurl = json["jumpurl"];
    }
    if (json["ori_picurl"] is String) {
      oriPicurl = json["ori_picurl"];
    }
  }

  static List<Content> fromList(List<Map<String, dynamic>> list) {
    return list.map(Content.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["value"] = value;
    _data["mid"] = mid;
    _data["type"] = type;
    _data["show_type"] = showType;
    _data["is_parent"] = isParent;
    _data["picurl"] = picurl;
    _data["read_cnt"] = readCnt;
    _data["author"] = author;
    _data["jumpurl"] = jumpurl;
    _data["ori_picurl"] = oriPicurl;
    return _data;
  }
}
