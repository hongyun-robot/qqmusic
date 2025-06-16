class CollectSong {
  late int result;
  Data? data;

  CollectSong({required this.result, this.data});

  CollectSong.fromJson(Map<String, dynamic> json) {
    if (json["result"] is int) {
      result = json["result"];
    }
    if (json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
  }

  static List<CollectSong> fromList(List<Map<String, dynamic>> list) {
    return list.map(CollectSong.fromJson).toList();
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
  late int code;
  late int subcode;
  late String msg;
  late int fromGedanPlaza;
  late int accessedPlazaCache;
  late int accessedByfav;
  late int optype;
  late int filterSongNum;
  late Dirinfo dirinfo;
  late List<Songlist> songlist;
  late int loginUin;
  late List<dynamic> invalidSong;
  late List<dynamic> filteredSong;
  late List<dynamic> adList;
  late int totalSongNum;
  late String encryptLogin;
  late int ct;
  late int cv;
  late String ip;
  late List<dynamic> orderlist;
  late CmtUrlBykey cmtUrlBykey;
  late String srfIp;
  late String referer;
  late int namedflag;
  late int isAd;
  late String adTitle;
  late String adUrl;
  late int isForbidComment;
  late List<dynamic> songtag;
  late List<dynamic> toplistSong;
  late bool toplistNolimit;
  late List<dynamic> sacForbid;
  late List<dynamic> birthday;
  late AiExt aiExt;
  late List<dynamic> vecSongidNewtime;
  late List<VecSongidType> vecSongidType;
  late List<dynamic> vecAiExtern;
  late int recomUgcValid;
  late List<dynamic> quickListenVid;
  late int bitflag;
  late int hasmore;

  Data1({
    required this.code,
    required this.subcode,
    required this.msg,
    required this.fromGedanPlaza,
    required this.accessedPlazaCache,
    required this.accessedByfav,
    required this.optype,
    required this.filterSongNum,
    required this.dirinfo,
    required this.songlist,
    required this.loginUin,
    required this.invalidSong,
    required this.filteredSong,
    required this.adList,
    required this.totalSongNum,
    required this.encryptLogin,
    required this.ct,
    required this.cv,
    required this.ip,
    required this.orderlist,
    required this.cmtUrlBykey,
    required this.srfIp,
    required this.referer,
    required this.namedflag,
    required this.isAd,
    required this.adTitle,
    required this.adUrl,
    required this.isForbidComment,
    required this.songtag,
    required this.toplistSong,
    required this.toplistNolimit,
    required this.sacForbid,
    required this.birthday,
    required this.aiExt,
    required this.vecSongidNewtime,
    required this.vecSongidType,
    required this.vecAiExtern,
    required this.recomUgcValid,
    required this.quickListenVid,
    required this.bitflag,
    required this.hasmore,
  });

  Data1.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["subcode"] is int) {
      subcode = json["subcode"];
    }
    if (json["msg"] is String) {
      msg = json["msg"];
    }
    if (json["from_gedan_plaza"] is int) {
      fromGedanPlaza = json["from_gedan_plaza"];
    }
    if (json["accessed_plaza_cache"] is int) {
      accessedPlazaCache = json["accessed_plaza_cache"];
    }
    if (json["accessed_byfav"] is int) {
      accessedByfav = json["accessed_byfav"];
    }
    if (json["optype"] is int) {
      optype = json["optype"];
    }
    if (json["filter_song_num"] is int) {
      filterSongNum = json["filter_song_num"];
    }
    if (json["dirinfo"] is Map) {
      dirinfo =
          (json["dirinfo"] == null ? null : Dirinfo.fromJson(json["dirinfo"]))!;
    }
    if (json["songlist"] is List) {
      songlist =
          (json["songlist"] == null
              ? null
              : (json["songlist"] as List)
                  .map((e) => Songlist.fromJson(e))
                  .toList())!;
    }
    if (json["login_uin"] is int) {
      loginUin = json["login_uin"];
    }
    if (json["invalid_song"] is List) {
      invalidSong = json["invalid_song"] ?? [];
    }
    if (json["filtered_song"] is List) {
      filteredSong = json["filtered_song"] ?? [];
    }
    if (json["ad_list"] is List) {
      adList = json["ad_list"] ?? [];
    }
    if (json["total_song_num"] is int) {
      totalSongNum = json["total_song_num"];
    }
    if (json["encrypt_login"] is String) {
      encryptLogin = json["encrypt_login"];
    }
    if (json["ct"] is int) {
      ct = json["ct"];
    }
    if (json["cv"] is int) {
      cv = json["cv"];
    }
    if (json["ip"] is String) {
      ip = json["ip"];
    }
    if (json["orderlist"] is List) {
      orderlist = json["orderlist"] ?? [];
    }
    if (json["cmtURL_bykey"] is Map) {
      cmtUrlBykey =
          (json["cmtURL_bykey"] == null
              ? null
              : CmtUrlBykey.fromJson(json["cmtURL_bykey"]))!;
    }
    if (json["srf_ip"] is String) {
      srfIp = json["srf_ip"];
    }
    if (json["referer"] is String) {
      referer = json["referer"];
    }
    if (json["namedflag"] is int) {
      namedflag = json["namedflag"];
    }
    if (json["isAd"] is int) {
      isAd = json["isAd"];
    }
    if (json["adTitle"] is String) {
      adTitle = json["adTitle"];
    }
    if (json["adUrl"] is String) {
      adUrl = json["adUrl"];
    }
    if (json["isForbidComment"] is int) {
      isForbidComment = json["isForbidComment"];
    }
    if (json["songtag"] is List) {
      songtag = json["songtag"] ?? [];
    }
    if (json["toplist_song"] is List) {
      toplistSong = json["toplist_song"] ?? [];
    }
    if (json["toplist_nolimit"] is bool) {
      toplistNolimit = json["toplist_nolimit"];
    }
    if (json["sac_forbid"] is List) {
      sacForbid = json["sac_forbid"] ?? [];
    }
    if (json["birthday"] is List) {
      birthday = json["birthday"] ?? [];
    }
    if (json["aiExt"] is Map) {
      aiExt = (json["aiExt"] == null ? null : AiExt.fromJson(json["aiExt"]))!;
    }
    if (json["vec_songid_newtime"] is List) {
      vecSongidNewtime = json["vec_songid_newtime"] ?? [];
    }
    if (json["vec_songid_type"] is List) {
      vecSongidType =
          (json["vec_songid_type"] == null
              ? null
              : (json["vec_songid_type"] as List)
                  .map((e) => VecSongidType.fromJson(e))
                  .toList())!;
    }
    if (json["vec_ai_extern"] is List) {
      vecAiExtern = json["vec_ai_extern"] ?? [];
    }
    if (json["recomUgcValid"] is int) {
      recomUgcValid = json["recomUgcValid"];
    }
    if (json["quickListenVid"] is List) {
      quickListenVid = json["quickListenVid"] ?? [];
    }
    if (json["bitflag"] is int) {
      bitflag = json["bitflag"];
    }
    if (json["hasmore"] is int) {
      hasmore = json["hasmore"];
    }
  }

  static List<Data1> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data1.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["subcode"] = subcode;
    _data["msg"] = msg;
    _data["from_gedan_plaza"] = fromGedanPlaza;
    _data["accessed_plaza_cache"] = accessedPlazaCache;
    _data["accessed_byfav"] = accessedByfav;
    _data["optype"] = optype;
    _data["filter_song_num"] = filterSongNum;
    if (dirinfo != null) {
      _data["dirinfo"] = dirinfo?.toJson();
    }
    if (songlist != null) {
      _data["songlist"] = songlist?.map((e) => e.toJson()).toList();
    }
    _data["login_uin"] = loginUin;
    if (invalidSong != null) {
      _data["invalid_song"] = invalidSong;
    }
    if (filteredSong != null) {
      _data["filtered_song"] = filteredSong;
    }
    if (adList != null) {
      _data["ad_list"] = adList;
    }
    _data["total_song_num"] = totalSongNum;
    _data["encrypt_login"] = encryptLogin;
    _data["ct"] = ct;
    _data["cv"] = cv;
    _data["ip"] = ip;
    if (orderlist != null) {
      _data["orderlist"] = orderlist;
    }
    if (cmtUrlBykey != null) {
      _data["cmtURL_bykey"] = cmtUrlBykey?.toJson();
    }
    _data["srf_ip"] = srfIp;
    _data["referer"] = referer;
    _data["namedflag"] = namedflag;
    _data["isAd"] = isAd;
    _data["adTitle"] = adTitle;
    _data["adUrl"] = adUrl;
    _data["isForbidComment"] = isForbidComment;
    if (songtag != null) {
      _data["songtag"] = songtag;
    }
    if (toplistSong != null) {
      _data["toplist_song"] = toplistSong;
    }
    _data["toplist_nolimit"] = toplistNolimit;
    if (sacForbid != null) {
      _data["sac_forbid"] = sacForbid;
    }
    if (birthday != null) {
      _data["birthday"] = birthday;
    }
    if (aiExt != null) {
      _data["aiExt"] = aiExt?.toJson();
    }
    if (vecSongidNewtime != null) {
      _data["vec_songid_newtime"] = vecSongidNewtime;
    }
    if (vecSongidType != null) {
      _data["vec_songid_type"] = vecSongidType?.map((e) => e.toJson()).toList();
    }
    if (vecAiExtern != null) {
      _data["vec_ai_extern"] = vecAiExtern;
    }
    _data["recomUgcValid"] = recomUgcValid;
    if (quickListenVid != null) {
      _data["quickListenVid"] = quickListenVid;
    }
    _data["bitflag"] = bitflag;
    _data["hasmore"] = hasmore;
    return _data;
  }
}

class VecSongidType {
  int? songid;
  int? songtype;

  VecSongidType({this.songid, this.songtype});

  VecSongidType.fromJson(Map<String, dynamic> json) {
    if (json["songid"] is int) {
      songid = json["songid"];
    }
    if (json["songtype"] is int) {
      songtype = json["songtype"];
    }
  }

  static List<VecSongidType> fromList(List<Map<String, dynamic>> list) {
    return list.map(VecSongidType.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["songid"] = songid;
    _data["songtype"] = songtype;
    return _data;
  }
}

class AiExt {
  List<dynamic>? couple;
  int? recommdays;
  String? nextLink;
  List<dynamic>? aiSongExt;
  int? allListening;
  String? strAllListening;
  String? listeningIcon;
  String? staticMsg;
  String? dynamicMsg;
  String? feedbackUrl;
  int? countdownTime;
  bool? isJoinExp;
  List<dynamic>? blkCntDnlist;
  int? limitVipSongNum;
  AiHelperCard? aiHelperCard;

  AiExt({
    this.couple,
    this.recommdays,
    this.nextLink,
    this.aiSongExt,
    this.allListening,
    this.strAllListening,
    this.listeningIcon,
    this.staticMsg,
    this.dynamicMsg,
    this.feedbackUrl,
    this.countdownTime,
    this.isJoinExp,
    this.blkCntDnlist,
    this.limitVipSongNum,
    this.aiHelperCard,
  });

  AiExt.fromJson(Map<String, dynamic> json) {
    if (json["couple"] is List) {
      couple = json["couple"] ?? [];
    }
    if (json["recommdays"] is int) {
      recommdays = json["recommdays"];
    }
    if (json["nextLink"] is String) {
      nextLink = json["nextLink"];
    }
    if (json["aiSongExt"] is List) {
      aiSongExt = json["aiSongExt"] ?? [];
    }
    if (json["allListening"] is int) {
      allListening = json["allListening"];
    }
    if (json["strAllListening"] is String) {
      strAllListening = json["strAllListening"];
    }
    if (json["listeningIcon"] is String) {
      listeningIcon = json["listeningIcon"];
    }
    if (json["static_msg"] is String) {
      staticMsg = json["static_msg"];
    }
    if (json["dynamic_msg"] is String) {
      dynamicMsg = json["dynamic_msg"];
    }
    if (json["feedbackURL"] is String) {
      feedbackUrl = json["feedbackURL"];
    }
    if (json["CountdownTime"] is int) {
      countdownTime = json["CountdownTime"];
    }
    if (json["ISJoinExp"] is bool) {
      isJoinExp = json["ISJoinExp"];
    }
    if (json["blkCntDnlist"] is List) {
      blkCntDnlist = json["blkCntDnlist"] ?? [];
    }
    if (json["limitVipSongNum"] is int) {
      limitVipSongNum = json["limitVipSongNum"];
    }
    if (json["aiHelperCard"] is Map) {
      aiHelperCard =
          json["aiHelperCard"] == null
              ? null
              : AiHelperCard.fromJson(json["aiHelperCard"]);
    }
  }

  static List<AiExt> fromList(List<Map<String, dynamic>> list) {
    return list.map(AiExt.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (couple != null) {
      _data["couple"] = couple;
    }
    _data["recommdays"] = recommdays;
    _data["nextLink"] = nextLink;
    if (aiSongExt != null) {
      _data["aiSongExt"] = aiSongExt;
    }
    _data["allListening"] = allListening;
    _data["strAllListening"] = strAllListening;
    _data["listeningIcon"] = listeningIcon;
    _data["static_msg"] = staticMsg;
    _data["dynamic_msg"] = dynamicMsg;
    _data["feedbackURL"] = feedbackUrl;
    _data["CountdownTime"] = countdownTime;
    _data["ISJoinExp"] = isJoinExp;
    if (blkCntDnlist != null) {
      _data["blkCntDnlist"] = blkCntDnlist;
    }
    _data["limitVipSongNum"] = limitVipSongNum;
    if (aiHelperCard != null) {
      _data["aiHelperCard"] = aiHelperCard?.toJson();
    }
    return _data;
  }
}

class AiHelperCard {
  String? title;
  String? descIcon;
  String? descText;
  String? bubble;
  String? scheme;
  List<dynamic>? aiTag;

  AiHelperCard({
    this.title,
    this.descIcon,
    this.descText,
    this.bubble,
    this.scheme,
    this.aiTag,
  });

  AiHelperCard.fromJson(Map<String, dynamic> json) {
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["desc_icon"] is String) {
      descIcon = json["desc_icon"];
    }
    if (json["desc_text"] is String) {
      descText = json["desc_text"];
    }
    if (json["bubble"] is String) {
      bubble = json["bubble"];
    }
    if (json["scheme"] is String) {
      scheme = json["scheme"];
    }
    if (json["aiTag"] is List) {
      aiTag = json["aiTag"] ?? [];
    }
  }

  static List<AiHelperCard> fromList(List<Map<String, dynamic>> list) {
    return list.map(AiHelperCard.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["desc_icon"] = descIcon;
    _data["desc_text"] = descText;
    _data["bubble"] = bubble;
    _data["scheme"] = scheme;
    if (aiTag != null) {
      _data["aiTag"] = aiTag;
    }
    return _data;
  }
}

class CmtUrlBykey {
  String? urlKey;
  String? urlParams;

  CmtUrlBykey({this.urlKey, this.urlParams});

  CmtUrlBykey.fromJson(Map<String, dynamic> json) {
    if (json["url_key"] is String) {
      urlKey = json["url_key"];
    }
    if (json["url_params"] is String) {
      urlParams = json["url_params"];
    }
  }

  static List<CmtUrlBykey> fromList(List<Map<String, dynamic>> list) {
    return list.map(CmtUrlBykey.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["url_key"] = urlKey;
    _data["url_params"] = urlParams;
    return _data;
  }
}

class Songlist {
  late int id;
  late int type;
  late int songtype;
  late int version;
  late String trace;
  late String mid;
  late String name;
  late String label;
  late String title;
  late String subtitle;
  late int interval;
  late int isonly;
  late int language;
  late int genre;
  late int indexCd;
  late int indexAlbum;
  late int status;
  late int fnote;
  late String url;
  late String timePublic;
  late List<Singer> singer;
  late Album album;
  late Mv mv;
  late Ksong ksong;
  late File file;
  late Volume volume;
  late Pay pay;
  late int uiAction;
  late int newIcon;
  late int tid;
  late int ov;
  late String tf;
  late int sa;
  late String es;
  late String abt;
  late String pingpong;
  late int dataType;
  late String ppurl;
  late List<String> vs;
  late int bpm;
  late String ktag;
  late String team;
  late List<num> vf;
  late int bf;

  Songlist({
    required this.id,
    required this.type,
    required this.songtype,
    required this.version,
    required this.trace,
    required this.mid,
    required this.name,
    required this.label,
    required this.title,
    required this.subtitle,
    required this.interval,
    required this.isonly,
    required this.language,
    required this.genre,
    required this.indexCd,
    required this.indexAlbum,
    required this.status,
    required this.fnote,
    required this.url,
    required this.timePublic,
    required this.singer,
    required this.album,
    required this.mv,
    required this.ksong,
    required this.file,
    required this.volume,
    required this.pay,
    required this.uiAction,
    required this.newIcon,
    required this.tid,
    required this.ov,
    required this.tf,
    required this.sa,
    required this.es,
    required this.abt,
    required this.pingpong,
    required this.dataType,
    required this.ppurl,
    required this.vs,
    required this.bpm,
    required this.ktag,
    required this.team,
    required this.vf,
    required this.bf,
  });

  Songlist.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["type"] is int) {
      type = json["type"];
    }
    if (json["songtype"] is int) {
      songtype = json["songtype"];
    }
    if (json["version"] is int) {
      version = json["version"];
    }
    if (json["trace"] is String) {
      trace = json["trace"];
    }
    if (json["mid"] is String) {
      mid = json["mid"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["label"] is String) {
      label = json["label"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["subtitle"] is String) {
      subtitle = json["subtitle"];
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
    if (json["status"] is int) {
      status = json["status"];
    }
    if (json["fnote"] is int) {
      fnote = json["fnote"];
    }
    if (json["url"] is String) {
      url = json["url"];
    }
    if (json["time_public"] is String) {
      timePublic = json["time_public"];
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
    if (json["ksong"] is Map) {
      ksong = (json["ksong"] == null ? null : Ksong.fromJson(json["ksong"]))!;
    }
    if (json["file"] is Map) {
      file = (json["file"] == null ? null : File.fromJson(json["file"]))!;
    }
    if (json["volume"] is Map) {
      volume =
          (json["volume"] == null ? null : Volume.fromJson(json["volume"]))!;
    }
    if (json["pay"] is Map) {
      pay = (json["pay"] == null ? null : Pay.fromJson(json["pay"]))!;
    }
    if (json["uiAction"] is int) {
      uiAction = json["uiAction"];
    }
    if (json["new_icon"] is int) {
      newIcon = json["new_icon"];
    }
    if (json["tid"] is int) {
      tid = json["tid"];
    }
    if (json["ov"] is int) {
      ov = json["ov"];
    }
    if (json["tf"] is String) {
      tf = json["tf"];
    }
    if (json["sa"] is int) {
      sa = json["sa"];
    }
    if (json["es"] is String) {
      es = json["es"];
    }
    if (json["abt"] is String) {
      abt = json["abt"];
    }
    if (json["pingpong"] is String) {
      pingpong = json["pingpong"];
    }
    if (json["data_type"] is int) {
      dataType = json["data_type"];
    }
    if (json["ppurl"] is String) {
      ppurl = json["ppurl"];
    }
    if (json["vs"] is List) {
      vs = (json["vs"] == null ? null : List<String>.from(json["vs"]))!;
    }
    if (json["bpm"] is int) {
      bpm = json["bpm"];
    }
    if (json["ktag"] is String) {
      ktag = json["ktag"];
    }
    if (json["team"] is String) {
      team = json["team"];
    }
    if (json["vf"] is List) {
      vf = (json["vf"] == null ? null : List<num>.from(json["vf"]))!;
    }
    if (json["bf"] is int) {
      bf = json["bf"];
    }
  }

  static List<Songlist> fromList(List<Map<String, dynamic>> list) {
    return list.map(Songlist.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["type"] = type;
    _data["songtype"] = songtype;
    _data["version"] = version;
    _data["trace"] = trace;
    _data["mid"] = mid;
    _data["name"] = name;
    _data["label"] = label;
    _data["title"] = title;
    _data["subtitle"] = subtitle;
    _data["interval"] = interval;
    _data["isonly"] = isonly;
    _data["language"] = language;
    _data["genre"] = genre;
    _data["index_cd"] = indexCd;
    _data["index_album"] = indexAlbum;
    _data["status"] = status;
    _data["fnote"] = fnote;
    _data["url"] = url;
    _data["time_public"] = timePublic;
    if (singer != null) {
      _data["singer"] = singer?.map((e) => e.toJson()).toList();
    }
    if (album != null) {
      _data["album"] = album?.toJson();
    }
    if (mv != null) {
      _data["mv"] = mv?.toJson();
    }
    if (ksong != null) {
      _data["ksong"] = ksong?.toJson();
    }
    if (file != null) {
      _data["file"] = file?.toJson();
    }
    if (volume != null) {
      _data["volume"] = volume?.toJson();
    }
    if (pay != null) {
      _data["pay"] = pay?.toJson();
    }
    _data["uiAction"] = uiAction;
    _data["new_icon"] = newIcon;
    _data["tid"] = tid;
    _data["ov"] = ov;
    _data["tf"] = tf;
    _data["sa"] = sa;
    _data["es"] = es;
    _data["abt"] = abt;
    _data["pingpong"] = pingpong;
    _data["data_type"] = dataType;
    _data["ppurl"] = ppurl;
    if (vs != null) {
      _data["vs"] = vs;
    }
    _data["bpm"] = bpm;
    _data["ktag"] = ktag;
    _data["team"] = team;
    if (vf != null) {
      _data["vf"] = vf;
    }
    _data["bf"] = bf;
    return _data;
  }
}

class Pay {
  int? payMonth;
  int? priceTrack;
  int? priceAlbum;
  int? payPlay;
  int? payDown;
  int? payStatus;
  int? timeFree;

  Pay({
    this.payMonth,
    this.priceTrack,
    this.priceAlbum,
    this.payPlay,
    this.payDown,
    this.payStatus,
    this.timeFree,
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

class Volume {
  double? gain;
  double? peak;
  double? lra;

  Volume({this.gain, this.peak, this.lra});

  Volume.fromJson(Map<String, dynamic> json) {
    if (json["gain"] is double) {
      gain = json["gain"];
    }
    if (json["peak"] is double) {
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

class File {
  String? mediaMid;
  int? sizeTry;
  int? tryBegin;
  int? tryEnd;
  int? size24Aac;
  int? size48Aac;
  int? size96Aac;
  int? size128Mp3;
  int? size192Ogg;
  int? size192Aac;
  int? size320Mp3;
  int? sizeFlac;
  int? sizeApe;
  int? sizeDts;
  int? sizeHires;
  int? hiresSample;
  int? hiresBitdepth;
  int? b30S;
  int? e30S;
  int? size96Ogg;
  List<dynamic>? size360Ra;
  int? sizeDolby;
  List<int>? sizeNew;

  File({
    this.mediaMid,
    this.sizeTry,
    this.tryBegin,
    this.tryEnd,
    this.size24Aac,
    this.size48Aac,
    this.size96Aac,
    this.size128Mp3,
    this.size192Ogg,
    this.size192Aac,
    this.size320Mp3,
    this.sizeFlac,
    this.sizeApe,
    this.sizeDts,
    this.sizeHires,
    this.hiresSample,
    this.hiresBitdepth,
    this.b30S,
    this.e30S,
    this.size96Ogg,
    this.size360Ra,
    this.sizeDolby,
    this.sizeNew,
  });

  File.fromJson(Map<String, dynamic> json) {
    if (json["media_mid"] is String) {
      mediaMid = json["media_mid"];
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
    if (json["size_24aac"] is int) {
      size24Aac = json["size_24aac"];
    }
    if (json["size_48aac"] is int) {
      size48Aac = json["size_48aac"];
    }
    if (json["size_96aac"] is int) {
      size96Aac = json["size_96aac"];
    }
    if (json["size_128mp3"] is int) {
      size128Mp3 = json["size_128mp3"];
    }
    if (json["size_192ogg"] is int) {
      size192Ogg = json["size_192ogg"];
    }
    if (json["size_192aac"] is int) {
      size192Aac = json["size_192aac"];
    }
    if (json["size_320mp3"] is int) {
      size320Mp3 = json["size_320mp3"];
    }
    if (json["size_flac"] is int) {
      sizeFlac = json["size_flac"];
    }
    if (json["size_ape"] is int) {
      sizeApe = json["size_ape"];
    }
    if (json["size_dts"] is int) {
      sizeDts = json["size_dts"];
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
          json["size_new"] == null ? null : List<int>.from(json["size_new"]);
    }
  }

  static List<File> fromList(List<Map<String, dynamic>> list) {
    return list.map(File.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["media_mid"] = mediaMid;
    _data["size_try"] = sizeTry;
    _data["try_begin"] = tryBegin;
    _data["try_end"] = tryEnd;
    _data["size_24aac"] = size24Aac;
    _data["size_48aac"] = size48Aac;
    _data["size_96aac"] = size96Aac;
    _data["size_128mp3"] = size128Mp3;
    _data["size_192ogg"] = size192Ogg;
    _data["size_192aac"] = size192Aac;
    _data["size_320mp3"] = size320Mp3;
    _data["size_flac"] = sizeFlac;
    _data["size_ape"] = sizeApe;
    _data["size_dts"] = sizeDts;
    _data["size_hires"] = sizeHires;
    _data["hires_sample"] = hiresSample;
    _data["hires_bitdepth"] = hiresBitdepth;
    _data["b_30s"] = b30S;
    _data["e_30s"] = e30S;
    _data["size_96ogg"] = size96Ogg;
    if (size360Ra != null) {
      _data["size_360ra"] = size360Ra;
    }
    _data["size_dolby"] = sizeDolby;
    if (sizeNew != null) {
      _data["size_new"] = sizeNew;
    }
    return _data;
  }
}

class Ksong {
  int? id;
  String? mid;

  Ksong({this.id, this.mid});

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

class Mv {
  int? id;
  String? vid;
  int? vt;

  Mv({this.id, this.vid, this.vt});

  Mv.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["vid"] is String) {
      vid = json["vid"];
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
    _data["vt"] = vt;
    return _data;
  }
}

class Album {
  late int id;
  late String mid;
  late String name;
  late String title;
  late String pmid;

  Album({
    required this.id,
    required this.mid,
    required this.name,
    required this.title,
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
    _data["pmid"] = pmid;
    return _data;
  }
}

class Singer {
  late int id;
  late String mid;
  late String name;
  late String title;

  Singer({
    required this.id,
    required this.mid,
    required this.name,
    required this.title,
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
    return _data;
  }
}

class Dirinfo {
  int? id;
  int? hostUin;
  int? dirid;
  String? title;
  String? picurl;
  int? picid;
  String? desc;
  List<dynamic>? vecTagid;
  List<dynamic>? vecTagname;
  int? ctime;
  int? mtime;
  int? listennum;
  int? ordernum;
  String? picmid;
  int? dirtype;
  String? hostNick;
  int? songnum;
  int? ordertime;
  int? show;
  String? picurl2;
  int? songUpdateTime;
  int? songUpdateNum;
  int? disstype;
  int? aiUin;
  int? dv2;
  int? dirShow;
  String? encryptUin;
  String? encryptAiUin;
  int? owndir;
  String? headurl;
  List<dynamic>? tag;
  Creator? creator;
  int? status;
  String? edgeMark;
  String? layerUrl;
  String? ext1;
  String? ext2;
  String? originTitle;
  bool? adTag;
  String? aiToast;
  int? role;
  int? rl2;

  Dirinfo({
    this.id,
    this.hostUin,
    this.dirid,
    this.title,
    this.picurl,
    this.picid,
    this.desc,
    this.vecTagid,
    this.vecTagname,
    this.ctime,
    this.mtime,
    this.listennum,
    this.ordernum,
    this.picmid,
    this.dirtype,
    this.hostNick,
    this.songnum,
    this.ordertime,
    this.show,
    this.picurl2,
    this.songUpdateTime,
    this.songUpdateNum,
    this.disstype,
    this.aiUin,
    this.dv2,
    this.dirShow,
    this.encryptUin,
    this.encryptAiUin,
    this.owndir,
    this.headurl,
    this.tag,
    this.creator,
    this.status,
    this.edgeMark,
    this.layerUrl,
    this.ext1,
    this.ext2,
    this.originTitle,
    this.adTag,
    this.aiToast,
    this.role,
    this.rl2,
  });

  Dirinfo.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["host_uin"] is int) {
      hostUin = json["host_uin"];
    }
    if (json["dirid"] is int) {
      dirid = json["dirid"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["picurl"] is String) {
      picurl = json["picurl"];
    }
    if (json["picid"] is int) {
      picid = json["picid"];
    }
    if (json["desc"] is String) {
      desc = json["desc"];
    }
    if (json["vec_tagid"] is List) {
      vecTagid = json["vec_tagid"] ?? [];
    }
    if (json["vec_tagname"] is List) {
      vecTagname = json["vec_tagname"] ?? [];
    }
    if (json["ctime"] is int) {
      ctime = json["ctime"];
    }
    if (json["mtime"] is int) {
      mtime = json["mtime"];
    }
    if (json["listennum"] is int) {
      listennum = json["listennum"];
    }
    if (json["ordernum"] is int) {
      ordernum = json["ordernum"];
    }
    if (json["picmid"] is String) {
      picmid = json["picmid"];
    }
    if (json["dirtype"] is int) {
      dirtype = json["dirtype"];
    }
    if (json["host_nick"] is String) {
      hostNick = json["host_nick"];
    }
    if (json["songnum"] is int) {
      songnum = json["songnum"];
    }
    if (json["ordertime"] is int) {
      ordertime = json["ordertime"];
    }
    if (json["show"] is int) {
      show = json["show"];
    }
    if (json["picurl2"] is String) {
      picurl2 = json["picurl2"];
    }
    if (json["song_update_time"] is int) {
      songUpdateTime = json["song_update_time"];
    }
    if (json["song_update_num"] is int) {
      songUpdateNum = json["song_update_num"];
    }
    if (json["disstype"] is int) {
      disstype = json["disstype"];
    }
    if (json["ai_uin"] is int) {
      aiUin = json["ai_uin"];
    }
    if (json["dv2"] is int) {
      dv2 = json["dv2"];
    }
    if (json["dir_show"] is int) {
      dirShow = json["dir_show"];
    }
    if (json["encrypt_uin"] is String) {
      encryptUin = json["encrypt_uin"];
    }
    if (json["encrypt_ai_uin"] is String) {
      encryptAiUin = json["encrypt_ai_uin"];
    }
    if (json["owndir"] is int) {
      owndir = json["owndir"];
    }
    if (json["headurl"] is String) {
      headurl = json["headurl"];
    }
    if (json["tag"] is List) {
      tag = json["tag"] ?? [];
    }
    if (json["creator"] is Map) {
      creator =
          json["creator"] == null ? null : Creator.fromJson(json["creator"]);
    }
    if (json["status"] is int) {
      status = json["status"];
    }
    if (json["edge_mark"] is String) {
      edgeMark = json["edge_mark"];
    }
    if (json["layer_url"] is String) {
      layerUrl = json["layer_url"];
    }
    if (json["ext1"] is String) {
      ext1 = json["ext1"];
    }
    if (json["ext2"] is String) {
      ext2 = json["ext2"];
    }
    if (json["origin_title"] is String) {
      originTitle = json["origin_title"];
    }
    if (json["ad_tag"] is bool) {
      adTag = json["ad_tag"];
    }
    if (json["aiToast"] is String) {
      aiToast = json["aiToast"];
    }
    if (json["role"] is int) {
      role = json["role"];
    }
    if (json["rl2"] is int) {
      rl2 = json["rl2"];
    }
  }

  static List<Dirinfo> fromList(List<Map<String, dynamic>> list) {
    return list.map(Dirinfo.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["host_uin"] = hostUin;
    _data["dirid"] = dirid;
    _data["title"] = title;
    _data["picurl"] = picurl;
    _data["picid"] = picid;
    _data["desc"] = desc;
    if (vecTagid != null) {
      _data["vec_tagid"] = vecTagid;
    }
    if (vecTagname != null) {
      _data["vec_tagname"] = vecTagname;
    }
    _data["ctime"] = ctime;
    _data["mtime"] = mtime;
    _data["listennum"] = listennum;
    _data["ordernum"] = ordernum;
    _data["picmid"] = picmid;
    _data["dirtype"] = dirtype;
    _data["host_nick"] = hostNick;
    _data["songnum"] = songnum;
    _data["ordertime"] = ordertime;
    _data["show"] = show;
    _data["picurl2"] = picurl2;
    _data["song_update_time"] = songUpdateTime;
    _data["song_update_num"] = songUpdateNum;
    _data["disstype"] = disstype;
    _data["ai_uin"] = aiUin;
    _data["dv2"] = dv2;
    _data["dir_show"] = dirShow;
    _data["encrypt_uin"] = encryptUin;
    _data["encrypt_ai_uin"] = encryptAiUin;
    _data["owndir"] = owndir;
    _data["headurl"] = headurl;
    if (tag != null) {
      _data["tag"] = tag;
    }
    if (creator != null) {
      _data["creator"] = creator?.toJson();
    }
    _data["status"] = status;
    _data["edge_mark"] = edgeMark;
    _data["layer_url"] = layerUrl;
    _data["ext1"] = ext1;
    _data["ext2"] = ext2;
    _data["origin_title"] = originTitle;
    _data["ad_tag"] = adTag;
    _data["aiToast"] = aiToast;
    _data["role"] = role;
    _data["rl2"] = rl2;
    return _data;
  }
}

class Creator {
  int? musicid;
  int? type;
  int? singerid;
  String? nick;
  String? headurl;
  String? ifpicurl;
  String? encryptUin;
  int? isVip;
  int? aiUin;
  String? encryptAiUin;
  dynamic ext;

  Creator({
    this.musicid,
    this.type,
    this.singerid,
    this.nick,
    this.headurl,
    this.ifpicurl,
    this.encryptUin,
    this.isVip,
    this.aiUin,
    this.encryptAiUin,
    this.ext,
  });

  Creator.fromJson(Map<String, dynamic> json) {
    if (json["musicid"] is int) {
      musicid = json["musicid"];
    }
    if (json["type"] is int) {
      type = json["type"];
    }
    if (json["singerid"] is int) {
      singerid = json["singerid"];
    }
    if (json["nick"] is String) {
      nick = json["nick"];
    }
    if (json["headurl"] is String) {
      headurl = json["headurl"];
    }
    if (json["ifpicurl"] is String) {
      ifpicurl = json["ifpicurl"];
    }
    if (json["encrypt_uin"] is String) {
      encryptUin = json["encrypt_uin"];
    }
    if (json["isVip"] is int) {
      isVip = json["isVip"];
    }
    if (json["ai_uin"] is int) {
      aiUin = json["ai_uin"];
    }
    if (json["encrypt_ai_uin"] is String) {
      encryptAiUin = json["encrypt_ai_uin"];
    }
    ext = json["ext"];
  }

  static List<Creator> fromList(List<Map<String, dynamic>> list) {
    return list.map(Creator.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["musicid"] = musicid;
    _data["type"] = type;
    _data["singerid"] = singerid;
    _data["nick"] = nick;
    _data["headurl"] = headurl;
    _data["ifpicurl"] = ifpicurl;
    _data["encrypt_uin"] = encryptUin;
    _data["isVip"] = isVip;
    _data["ai_uin"] = aiUin;
    _data["encrypt_ai_uin"] = encryptAiUin;
    _data["ext"] = ext;
    return _data;
  }
}
