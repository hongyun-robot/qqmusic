class SongUrl {
  Data? data;
  late int result;
  String? errMsg;

  SongUrl({this.data, this.errMsg, required this.result});

  SongUrl.fromJson(Map<String, dynamic> json) {
    if (json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
    if (json["result"] is int) {
      result = json["result"];
    }
    if (json["errMsg"] is String) {
      errMsg = json["errMsg"];
    }
  }

  static List<SongUrl> fromList(List<Map<String, dynamic>> list) {
    return list.map(SongUrl.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    _data["result"] = result;
    _data["errMsg"] = errMsg;
    return _data;
  }
}

class Data {
  late String url;
  late RawData rawData;

  Data({required this.url, required this.rawData});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["url"] is String) {
      url = json["url"];
    }
    if (json["rawData"] is Map) {
      rawData =
          (json["rawData"] == null ? null : RawData.fromJson(json["rawData"]))!;
    }
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["url"] = url;
    _data["rawData"] = rawData.toJson();
    return _data;
  }
}

class RawData {
  late int code;
  late int ts;
  late int startTs;
  late String traceid;
  late Req0 req0;

  RawData({
    required this.code,
    required this.ts,
    required this.startTs,
    required this.traceid,
    required this.req0,
  });

  RawData.fromJson(Map<String, dynamic> json) {
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
    if (json["req_0"] is Map) {
      req0 = (json["req_0"] == null ? null : Req0.fromJson(json["req_0"]))!;
    }
  }

  static List<RawData> fromList(List<Map<String, dynamic>> list) {
    return list.map(RawData.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["ts"] = ts;
    _data["start_ts"] = startTs;
    _data["traceid"] = traceid;
    _data["req_0"] = req0.toJson();
    return _data;
  }
}

class Req0 {
  late int code;
  late Data1 data;

  Req0({required this.code, required this.data});

  Req0.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["data"] is Map) {
      data = (json["data"] == null ? null : Data1.fromJson(json["data"]))!;
    }
  }

  static List<Req0> fromList(List<Map<String, dynamic>> list) {
    return list.map(Req0.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["data"] = data.toJson();
    return _data;
  }
}

class Data1 {
  late String uin;
  late int retcode;
  late int verifyType;
  late String loginKey;
  late String msg;
  late List<String> sip;
  late List<String> thirdip;
  late String testfile2G;
  late String testfilewifi;
  late List<Midurlinfo> midurlinfo;
  late String servercheck;
  late int expiration;
  late String deviceResult;

  Data1({
    required this.uin,
    required this.retcode,
    required this.verifyType,
    required this.loginKey,
    required this.msg,
    required this.sip,
    required this.thirdip,
    required this.testfile2G,
    required this.testfilewifi,
    required this.midurlinfo,
    required this.servercheck,
    required this.expiration,
    required this.deviceResult,
  });

  Data1.fromJson(Map<String, dynamic> json) {
    if (json["uin"] is String) {
      uin = json["uin"];
    }
    if (json["retcode"] is int) {
      retcode = json["retcode"];
    }
    if (json["verify_type"] is int) {
      verifyType = json["verify_type"];
    }
    if (json["login_key"] is String) {
      loginKey = json["login_key"];
    }
    if (json["msg"] is String) {
      msg = json["msg"];
    }
    if (json["sip"] is List) {
      sip = (json["sip"] == null ? null : List<String>.from(json["sip"]))!;
    }
    if (json["thirdip"] is List) {
      thirdip =
          (json["thirdip"] == null
              ? null
              : List<String>.from(json["thirdip"]))!;
    }
    if (json["testfile2g"] is String) {
      testfile2G = json["testfile2g"];
    }
    if (json["testfilewifi"] is String) {
      testfilewifi = json["testfilewifi"];
    }
    if (json["midurlinfo"] is List) {
      midurlinfo =
          (json["midurlinfo"] == null
              ? null
              : (json["midurlinfo"] as List)
                  .map((e) => Midurlinfo.fromJson(e))
                  .toList())!;
    }
    if (json["servercheck"] is String) {
      servercheck = json["servercheck"];
    }
    if (json["expiration"] is int) {
      expiration = json["expiration"];
    }
    if (json["deviceResult"] is String) {
      deviceResult = json["deviceResult"];
    }
  }

  static List<Data1> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data1.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["uin"] = uin;
    _data["retcode"] = retcode;
    _data["verify_type"] = verifyType;
    _data["login_key"] = loginKey;
    _data["msg"] = msg;
    _data["sip"] = sip;
    _data["thirdip"] = thirdip;
    _data["testfile2g"] = testfile2G;
    _data["testfilewifi"] = testfilewifi;
    _data["midurlinfo"] = midurlinfo.map((e) => e.toJson()).toList();
    _data["servercheck"] = servercheck;
    _data["expiration"] = expiration;
    _data["deviceResult"] = deviceResult;
    return _data;
  }
}

class Midurlinfo {
  late String songmid;
  late String filename;
  late String purl;
  late String errtype;
  late int p2Pfromtag;
  late int qmdlfromtag;
  late int commonDownfromtag;
  late int vipDownfromtag;
  late int pdl;
  late int premain;
  late int hisdown;
  late int hisbuy;
  late int uiAlert;
  late int isbuy;
  late int pneedbuy;
  late int pneed;
  late int isonly;
  late int onecan;
  late int result;
  late String tips;
  late String opi48Kurl;
  late String opi96Kurl;
  late String opi192Kurl;
  late String opiflackurl;
  late String opi128Kurl;
  late String opi192Koggurl;
  late String wififromtag;
  late String flowfromtag;
  late String wifiurl;
  late String flowurl;
  late String vkey;
  late String opi30Surl;
  late String ekey;
  late int authSwitch;
  late int subcode;
  late String opi96Koggurl;
  late int authSwitch2;
  late String xcdnurl;

  Midurlinfo({
    required this.songmid,
    required this.filename,
    required this.purl,
    required this.errtype,
    required this.p2Pfromtag,
    required this.qmdlfromtag,
    required this.commonDownfromtag,
    required this.vipDownfromtag,
    required this.pdl,
    required this.premain,
    required this.hisdown,
    required this.hisbuy,
    required this.uiAlert,
    required this.isbuy,
    required this.pneedbuy,
    required this.pneed,
    required this.isonly,
    required this.onecan,
    required this.result,
    required this.tips,
    required this.opi48Kurl,
    required this.opi96Kurl,
    required this.opi192Kurl,
    required this.opiflackurl,
    required this.opi128Kurl,
    required this.opi192Koggurl,
    required this.wififromtag,
    required this.flowfromtag,
    required this.wifiurl,
    required this.flowurl,
    required this.vkey,
    required this.opi30Surl,
    required this.ekey,
    required this.authSwitch,
    required this.subcode,
    required this.opi96Koggurl,
    required this.authSwitch2,
    required this.xcdnurl,
  });

  Midurlinfo.fromJson(Map<String, dynamic> json) {
    if (json["songmid"] is String) {
      songmid = json["songmid"];
    }
    if (json["filename"] is String) {
      filename = json["filename"];
    }
    if (json["purl"] is String) {
      purl = json["purl"];
    }
    if (json["errtype"] is String) {
      errtype = json["errtype"];
    }
    if (json["p2pfromtag"] is int) {
      p2Pfromtag = json["p2pfromtag"];
    }
    if (json["qmdlfromtag"] is int) {
      qmdlfromtag = json["qmdlfromtag"];
    }
    if (json["common_downfromtag"] is int) {
      commonDownfromtag = json["common_downfromtag"];
    }
    if (json["vip_downfromtag"] is int) {
      vipDownfromtag = json["vip_downfromtag"];
    }
    if (json["pdl"] is int) {
      pdl = json["pdl"];
    }
    if (json["premain"] is int) {
      premain = json["premain"];
    }
    if (json["hisdown"] is int) {
      hisdown = json["hisdown"];
    }
    if (json["hisbuy"] is int) {
      hisbuy = json["hisbuy"];
    }
    if (json["uiAlert"] is int) {
      uiAlert = json["uiAlert"];
    }
    if (json["isbuy"] is int) {
      isbuy = json["isbuy"];
    }
    if (json["pneedbuy"] is int) {
      pneedbuy = json["pneedbuy"];
    }
    if (json["pneed"] is int) {
      pneed = json["pneed"];
    }
    if (json["isonly"] is int) {
      isonly = json["isonly"];
    }
    if (json["onecan"] is int) {
      onecan = json["onecan"];
    }
    if (json["result"] is int) {
      result = json["result"];
    }
    if (json["tips"] is String) {
      tips = json["tips"];
    }
    if (json["opi48kurl"] is String) {
      opi48Kurl = json["opi48kurl"];
    }
    if (json["opi96kurl"] is String) {
      opi96Kurl = json["opi96kurl"];
    }
    if (json["opi192kurl"] is String) {
      opi192Kurl = json["opi192kurl"];
    }
    if (json["opiflackurl"] is String) {
      opiflackurl = json["opiflackurl"];
    }
    if (json["opi128kurl"] is String) {
      opi128Kurl = json["opi128kurl"];
    }
    if (json["opi192koggurl"] is String) {
      opi192Koggurl = json["opi192koggurl"];
    }
    if (json["wififromtag"] is String) {
      wififromtag = json["wififromtag"];
    }
    if (json["flowfromtag"] is String) {
      flowfromtag = json["flowfromtag"];
    }
    if (json["wifiurl"] is String) {
      wifiurl = json["wifiurl"];
    }
    if (json["flowurl"] is String) {
      flowurl = json["flowurl"];
    }
    if (json["vkey"] is String) {
      vkey = json["vkey"];
    }
    if (json["opi30surl"] is String) {
      opi30Surl = json["opi30surl"];
    }
    if (json["ekey"] is String) {
      ekey = json["ekey"];
    }
    if (json["auth_switch"] is int) {
      authSwitch = json["auth_switch"];
    }
    if (json["subcode"] is int) {
      subcode = json["subcode"];
    }
    if (json["opi96koggurl"] is String) {
      opi96Koggurl = json["opi96koggurl"];
    }
    if (json["auth_switch2"] is int) {
      authSwitch2 = json["auth_switch2"];
    }
    if (json["xcdnurl"] is String) {
      xcdnurl = json["xcdnurl"];
    }
  }

  static List<Midurlinfo> fromList(List<Map<String, dynamic>> list) {
    return list.map(Midurlinfo.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["songmid"] = songmid;
    _data["filename"] = filename;
    _data["purl"] = purl;
    _data["errtype"] = errtype;
    _data["p2pfromtag"] = p2Pfromtag;
    _data["qmdlfromtag"] = qmdlfromtag;
    _data["common_downfromtag"] = commonDownfromtag;
    _data["vip_downfromtag"] = vipDownfromtag;
    _data["pdl"] = pdl;
    _data["premain"] = premain;
    _data["hisdown"] = hisdown;
    _data["hisbuy"] = hisbuy;
    _data["uiAlert"] = uiAlert;
    _data["isbuy"] = isbuy;
    _data["pneedbuy"] = pneedbuy;
    _data["pneed"] = pneed;
    _data["isonly"] = isonly;
    _data["onecan"] = onecan;
    _data["result"] = result;
    _data["tips"] = tips;
    _data["opi48kurl"] = opi48Kurl;
    _data["opi96kurl"] = opi96Kurl;
    _data["opi192kurl"] = opi192Kurl;
    _data["opiflackurl"] = opiflackurl;
    _data["opi128kurl"] = opi128Kurl;
    _data["opi192koggurl"] = opi192Koggurl;
    _data["wififromtag"] = wififromtag;
    _data["flowfromtag"] = flowfromtag;
    _data["wifiurl"] = wifiurl;
    _data["flowurl"] = flowurl;
    _data["vkey"] = vkey;
    _data["opi30surl"] = opi30Surl;
    _data["ekey"] = ekey;
    _data["auth_switch"] = authSwitch;
    _data["subcode"] = subcode;
    _data["opi96koggurl"] = opi96Koggurl;
    _data["auth_switch2"] = authSwitch2;
    _data["xcdnurl"] = xcdnurl;
    return _data;
  }
}
