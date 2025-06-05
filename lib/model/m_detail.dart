class Mdetail {
  int? code;
  int? subcode;
  String? msg;
  String? errMsg;
  Data? data;
  late int result;

  Mdetail({
    this.code,
    this.subcode,
    this.msg,
    this.errMsg,
    this.data,
    required this.result,
  });

  Mdetail.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["subcode"] is int) {
      subcode = json["subcode"];
    }
    if (json["msg"] is String) {
      msg = json["msg"];
    }
    if (json["errMsg"] is String) {
      errMsg = json["errMsg"];
    }
    if (json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
    if (json["result"] is int) {
      result = json["result"];
    }
  }

  static List<Mdetail> fromList(List<Map<String, dynamic>> list) {
    return list.map(Mdetail.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["subcode"] = subcode;
    _data["msg"] = msg;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    _data["result"] = result;
    return _data;
  }
}

class Data {
  late Creator creator;
  late String mymusictype;
  late List<Mymusic> mymusic;
  late Mydiss mydiss;
  late Video video;
  late Myarticle myarticle;
  late Myradio myradio;

  Data({
    required this.creator,
    required this.mymusictype,
    required this.mymusic,
    required this.mydiss,
    required this.video,
    required this.myarticle,
    required this.myradio,
  });

  Data.fromJson(Map<String, dynamic> json) {
    if (json["creator"] is Map) {
      creator =
          (json["creator"] == null ? null : Creator.fromJson(json["creator"]))!;
    }
    if (json["mymusictype"] is String) {
      mymusictype = json["mymusictype"];
    }
    if (json["mymusic"] is List) {
      mymusic =
          (json["mymusic"] == null
              ? null
              : (json["mymusic"] as List)
                  .map((e) => Mymusic.fromJson(e))
                  .toList())!;
    }
    if (json["mydiss"] is Map) {
      mydiss =
          (json["mydiss"] == null ? null : Mydiss.fromJson(json["mydiss"]))!;
    }
    if (json["video"] is Map) {
      video = (json["video"] == null ? null : Video.fromJson(json["video"]))!;
    }
    if (json["myarticle"] is Map) {
      myarticle =
          (json["myarticle"] == null
              ? null
              : Myarticle.fromJson(json["myarticle"]))!;
    }
    if (json["myradio"] is Map) {
      myradio =
          (json["myradio"] == null ? null : Myradio.fromJson(json["myradio"]))!;
    }
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["creator"] = creator.toJson();
    _data["mymusictype"] = mymusictype;
    _data["mymusic"] = mymusic.map((e) => e.toJson()).toList();
    _data["mydiss"] = mydiss.toJson();
    _data["video"] = video.toJson();
    _data["myarticle"] = myarticle.toJson();
    _data["myradio"] = myradio.toJson();
    return _data;
  }
}

class Myradio {
  String? title;
  String? jumpurl;
  String? jumpkey;
  String? laypic;
  int? totalcnt;
  List<dynamic>? mlist;

  Myradio({
    this.title,
    this.jumpurl,
    this.jumpkey,
    this.laypic,
    this.totalcnt,
    this.mlist,
  });

  Myradio.fromJson(Map<String, dynamic> json) {
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["jumpurl"] is String) {
      jumpurl = json["jumpurl"];
    }
    if (json["jumpkey"] is String) {
      jumpkey = json["jumpkey"];
    }
    if (json["laypic"] is String) {
      laypic = json["laypic"];
    }
    if (json["totalcnt"] is int) {
      totalcnt = json["totalcnt"];
    }
    if (json["mlist"] is List) {
      mlist = json["mlist"] ?? [];
    }
  }

  static List<Myradio> fromList(List<Map<String, dynamic>> list) {
    return list.map(Myradio.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["jumpurl"] = jumpurl;
    _data["jumpkey"] = jumpkey;
    _data["laypic"] = laypic;
    _data["totalcnt"] = totalcnt;
    if (mlist != null) {
      _data["mlist"] = mlist;
    }
    return _data;
  }
}

class Myarticle {
  String? title;
  String? jumpurl;
  String? jumpkey;
  String? laypic;
  int? totalcnt;
  List<dynamic>? mlist;

  Myarticle({
    this.title,
    this.jumpurl,
    this.jumpkey,
    this.laypic,
    this.totalcnt,
    this.mlist,
  });

  Myarticle.fromJson(Map<String, dynamic> json) {
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["jumpurl"] is String) {
      jumpurl = json["jumpurl"];
    }
    if (json["jumpkey"] is String) {
      jumpkey = json["jumpkey"];
    }
    if (json["laypic"] is String) {
      laypic = json["laypic"];
    }
    if (json["totalcnt"] is int) {
      totalcnt = json["totalcnt"];
    }
    if (json["mlist"] is List) {
      mlist = json["mlist"] ?? [];
    }
  }

  static List<Myarticle> fromList(List<Map<String, dynamic>> list) {
    return list.map(Myarticle.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["jumpurl"] = jumpurl;
    _data["jumpkey"] = jumpkey;
    _data["laypic"] = laypic;
    _data["totalcnt"] = totalcnt;
    if (mlist != null) {
      _data["mlist"] = mlist;
    }
    return _data;
  }
}

class Video {
  int? num;
  String? title;
  String? jumpurl;
  String? jumpkey;
  List<dynamic>? mlist;

  Video({this.num, this.title, this.jumpurl, this.jumpkey, this.mlist});

  Video.fromJson(Map<String, dynamic> json) {
    if (json["num"] is int) {
      num = json["num"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["jumpurl"] is String) {
      jumpurl = json["jumpurl"];
    }
    if (json["jumpkey"] is String) {
      jumpkey = json["jumpkey"];
    }
    if (json["mlist"] is List) {
      mlist = json["mlist"] ?? [];
    }
  }

  static List<Video> fromList(List<Map<String, dynamic>> list) {
    return list.map(Video.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["num"] = num;
    _data["title"] = title;
    _data["jumpurl"] = jumpurl;
    _data["jumpkey"] = jumpkey;
    if (mlist != null) {
      _data["mlist"] = mlist;
    }
    return _data;
  }
}

class Mydiss {
  int? num;
  String? title;
  String? laypic;
  String? jumpurl;
  List<Mlist>? mlist;

  Mydiss({this.num, this.title, this.laypic, this.jumpurl, this.mlist});

  Mydiss.fromJson(Map<String, dynamic> json) {
    if (json["num"] is int) {
      num = json["num"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["laypic"] is String) {
      laypic = json["laypic"];
    }
    if (json["jumpurl"] is String) {
      jumpurl = json["jumpurl"];
    }
    if (json["mlist"] is List) {
      mlist =
          json["mlist"] == null
              ? null
              : (json["mlist"] as List).map((e) => Mlist.fromJson(e)).toList();
    }
  }

  static List<Mydiss> fromList(List<Map<String, dynamic>> list) {
    return list.map(Mydiss.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["num"] = num;
    _data["title"] = title;
    _data["laypic"] = laypic;
    _data["jumpurl"] = jumpurl;
    if (mlist != null) {
      _data["mlist"] = mlist?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Mlist {
  int? dissid;
  int? dirid;
  String? picurl;
  String? title;
  String? subtitle;
  int? icontype;
  String? iconurl;
  int? isshow;
  int? dirShow;

  Mlist({
    this.dissid,
    this.dirid,
    this.picurl,
    this.title,
    this.subtitle,
    this.icontype,
    this.iconurl,
    this.isshow,
    this.dirShow,
  });

  Mlist.fromJson(Map<String, dynamic> json) {
    if (json["dissid"] is int) {
      dissid = json["dissid"];
    }
    if (json["dirid"] is int) {
      dirid = json["dirid"];
    }
    if (json["picurl"] is String) {
      picurl = json["picurl"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["subtitle"] is String) {
      subtitle = json["subtitle"];
    }
    if (json["icontype"] is int) {
      icontype = json["icontype"];
    }
    if (json["iconurl"] is String) {
      iconurl = json["iconurl"];
    }
    if (json["isshow"] is int) {
      isshow = json["isshow"];
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
    _data["dissid"] = dissid;
    _data["dirid"] = dirid;
    _data["picurl"] = picurl;
    _data["title"] = title;
    _data["subtitle"] = subtitle;
    _data["icontype"] = icontype;
    _data["iconurl"] = iconurl;
    _data["isshow"] = isshow;
    _data["dir_show"] = dirShow;
    return _data;
  }
}

class Mymusic {
  String? title;
  String? picurl;
  String? laypic;
  String? subtitle;
  String? jumpurl;
  int? jumptype;
  String? jumpkey;
  String? id;
  MusicBykey? musicBykey;
  int? type;
  int? num0;
  int? num1;
  int? num2;

  Mymusic({
    this.title,
    this.picurl,
    this.laypic,
    this.subtitle,
    this.jumpurl,
    this.jumptype,
    this.jumpkey,
    this.id,
    this.musicBykey,
    this.type,
    this.num0,
    this.num1,
    this.num2,
  });

  Mymusic.fromJson(Map<String, dynamic> json) {
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["picurl"] is String) {
      picurl = json["picurl"];
    }
    if (json["laypic"] is String) {
      laypic = json["laypic"];
    }
    if (json["subtitle"] is String) {
      subtitle = json["subtitle"];
    }
    if (json["jumpurl"] is String) {
      jumpurl = json["jumpurl"];
    }
    if (json["jumptype"] is int) {
      jumptype = json["jumptype"];
    }
    if (json["jumpkey"] is String) {
      jumpkey = json["jumpkey"];
    }
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["music_bykey"] is Map) {
      musicBykey =
          json["music_bykey"] == null
              ? null
              : MusicBykey.fromJson(json["music_bykey"]);
    }
    if (json["type"] is int) {
      type = json["type"];
    }
    if (json["num0"] is int) {
      num0 = json["num0"];
    }
    if (json["num1"] is int) {
      num1 = json["num1"];
    }
    if (json["num2"] is int) {
      num2 = json["num2"];
    }
  }

  static List<Mymusic> fromList(List<Map<String, dynamic>> list) {
    return list.map(Mymusic.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["picurl"] = picurl;
    _data["laypic"] = laypic;
    _data["subtitle"] = subtitle;
    _data["jumpurl"] = jumpurl;
    _data["jumptype"] = jumptype;
    _data["jumpkey"] = jumpkey;
    _data["id"] = id;
    if (musicBykey != null) {
      _data["music_bykey"] = musicBykey?.toJson();
    }
    _data["type"] = type;
    _data["num0"] = num0;
    _data["num1"] = num1;
    _data["num2"] = num2;
    return _data;
  }
}

class MusicBykey {
  String? urlKey;
  String? urlParams;

  MusicBykey({this.urlKey, this.urlParams});

  MusicBykey.fromJson(Map<String, dynamic> json) {
    if (json["url_key"] is String) {
      urlKey = json["url_key"];
    }
    if (json["url_params"] is String) {
      urlParams = json["url_params"];
    }
  }

  static List<MusicBykey> fromList(List<Map<String, dynamic>> list) {
    return list.map(MusicBykey.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["url_key"] = urlKey;
    _data["url_params"] = urlParams;
    return _data;
  }
}

class Creator {
  late String nick;
  late String headpic;
  late String ifpic;
  late int uin;
  late int forbidden;
  late int ishost;
  late int isBindWeibo;
  late String weiboUid;
  late String weiboNick;
  late String extra;
  late Singerinfo singerinfo;
  late String uinWeb;
  late String encryptUin;
  late int isfollow;
  late int islock;
  late int buyLock;
  late int favLock;
  late int dissLock;
  late String shareurl;
  late ShareBykey shareBykey;
  late String jumpkey;
  late Typeinfo typeinfo;
  late List<Lvinfo> lvinfo;
  late UserInfoUi userInfoUi;
  late Medal medal;
  late Listeninfo listeninfo;
  late Backpic backpic;
  late Cfinfo cfinfo;
  late Nums nums;

  Creator({
    required this.nick,
    required this.headpic,
    required this.ifpic,
    required this.uin,
    required this.forbidden,
    required this.ishost,
    required this.isBindWeibo,
    required this.weiboUid,
    required this.weiboNick,
    required this.extra,
    required this.singerinfo,
    required this.uinWeb,
    required this.encryptUin,
    required this.isfollow,
    required this.islock,
    required this.buyLock,
    required this.favLock,
    required this.dissLock,
    required this.shareurl,
    required this.shareBykey,
    required this.jumpkey,
    required this.typeinfo,
    required this.lvinfo,
    required this.userInfoUi,
    required this.medal,
    required this.listeninfo,
    required this.backpic,
    required this.cfinfo,
    required this.nums,
  });

  Creator.fromJson(Map<String, dynamic> json) {
    if (json["nick"] is String) {
      nick = json["nick"];
    }
    if (json["headpic"] is String) {
      headpic = json["headpic"];
    }
    if (json["ifpic"] is String) {
      ifpic = json["ifpic"];
    }
    if (json["uin"] is int) {
      uin = json["uin"];
    }
    if (json["forbidden"] is int) {
      forbidden = json["forbidden"];
    }
    if (json["ishost"] is int) {
      ishost = json["ishost"];
    }
    if (json["is_bind_weibo"] is int) {
      isBindWeibo = json["is_bind_weibo"];
    }
    if (json["weibo_uid"] is String) {
      weiboUid = json["weibo_uid"];
    }
    if (json["weibo_nick"] is String) {
      weiboNick = json["weibo_nick"];
    }
    if (json["extra"] is String) {
      extra = json["extra"];
    }
    if (json["singerinfo"] is Map) {
      singerinfo =
          (json["singerinfo"] == null
              ? null
              : Singerinfo.fromJson(json["singerinfo"]))!;
    }
    if (json["uin_web"] is String) {
      uinWeb = json["uin_web"];
    }
    if (json["encrypt_uin"] is String) {
      encryptUin = json["encrypt_uin"];
    }
    if (json["isfollow"] is int) {
      isfollow = json["isfollow"];
    }
    if (json["islock"] is int) {
      islock = json["islock"];
    }
    if (json["buy_lock"] is int) {
      buyLock = json["buy_lock"];
    }
    if (json["fav_lock"] is int) {
      favLock = json["fav_lock"];
    }
    if (json["diss_lock"] is int) {
      dissLock = json["diss_lock"];
    }
    if (json["shareurl"] is String) {
      shareurl = json["shareurl"];
    }
    if (json["share_bykey"] is Map) {
      shareBykey =
          (json["share_bykey"] == null
              ? null
              : ShareBykey.fromJson(json["share_bykey"]))!;
    }
    if (json["jumpkey"] is String) {
      jumpkey = json["jumpkey"];
    }
    if (json["typeinfo"] is Map) {
      typeinfo =
          (json["typeinfo"] == null
              ? null
              : Typeinfo.fromJson(json["typeinfo"]))!;
    }
    if (json["lvinfo"] is List) {
      lvinfo =
          (json["lvinfo"] == null
              ? null
              : (json["lvinfo"] as List)
                  .map((e) => Lvinfo.fromJson(e))
                  .toList())!;
    }
    if (json["userInfoUI"] is Map) {
      userInfoUi =
          (json["userInfoUI"] == null
              ? null
              : UserInfoUi.fromJson(json["userInfoUI"]))!;
    }
    if (json["medal"] is Map) {
      medal = (json["medal"] == null ? null : Medal.fromJson(json["medal"]))!;
    }
    if (json["listeninfo"] is Map) {
      listeninfo =
          (json["listeninfo"] == null
              ? null
              : Listeninfo.fromJson(json["listeninfo"]))!;
    }
    if (json["backpic"] is Map) {
      backpic =
          (json["backpic"] == null ? null : Backpic.fromJson(json["backpic"]))!;
    }
    if (json["cfinfo"] is Map) {
      cfinfo =
          (json["cfinfo"] == null ? null : Cfinfo.fromJson(json["cfinfo"]))!;
    }
    if (json["nums"] is Map) {
      nums = (json["nums"] == null ? null : Nums.fromJson(json["nums"]))!;
    }
  }

  static List<Creator> fromList(List<Map<String, dynamic>> list) {
    return list.map(Creator.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["nick"] = nick;
    _data["headpic"] = headpic;
    _data["ifpic"] = ifpic;
    _data["uin"] = uin;
    _data["forbidden"] = forbidden;
    _data["ishost"] = ishost;
    _data["is_bind_weibo"] = isBindWeibo;
    _data["weibo_uid"] = weiboUid;
    _data["weibo_nick"] = weiboNick;
    _data["extra"] = extra;
    _data["singerinfo"] = singerinfo.toJson();
    _data["uin_web"] = uinWeb;
    _data["encrypt_uin"] = encryptUin;
    _data["isfollow"] = isfollow;
    _data["islock"] = islock;
    _data["buy_lock"] = buyLock;
    _data["fav_lock"] = favLock;
    _data["diss_lock"] = dissLock;
    _data["shareurl"] = shareurl;
    _data["share_bykey"] = shareBykey.toJson();
    _data["jumpkey"] = jumpkey;
    _data["typeinfo"] = typeinfo.toJson();
    _data["lvinfo"] = lvinfo.map((e) => e.toJson()).toList();
    _data["userInfoUI"] = userInfoUi.toJson();
    _data["medal"] = medal.toJson();
    _data["listeninfo"] = listeninfo.toJson();
    _data["backpic"] = backpic.toJson();
    _data["cfinfo"] = cfinfo.toJson();
    _data["nums"] = nums.toJson();
    return _data;
  }
}

class Nums {
  int? visitornum;
  int? fansnum;
  int? follownum;
  int? followusernum;
  int? followsingernum;
  int? frdnum;

  Nums({
    this.visitornum,
    this.fansnum,
    this.follownum,
    this.followusernum,
    this.followsingernum,
    this.frdnum,
  });

  Nums.fromJson(Map<String, dynamic> json) {
    if (json["visitornum"] is int) {
      visitornum = json["visitornum"];
    }
    if (json["fansnum"] is int) {
      fansnum = json["fansnum"];
    }
    if (json["follownum"] is int) {
      follownum = json["follownum"];
    }
    if (json["followusernum"] is int) {
      followusernum = json["followusernum"];
    }
    if (json["followsingernum"] is int) {
      followsingernum = json["followsingernum"];
    }
    if (json["frdnum"] is int) {
      frdnum = json["frdnum"];
    }
  }

  static List<Nums> fromList(List<Map<String, dynamic>> list) {
    return list.map(Nums.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["visitornum"] = visitornum;
    _data["fansnum"] = fansnum;
    _data["follownum"] = follownum;
    _data["followusernum"] = followusernum;
    _data["followsingernum"] = followsingernum;
    _data["frdnum"] = frdnum;
    return _data;
  }
}

class Cfinfo {
  String? title;
  String? jumpurl;
  String? jumpkey;
  CfinfoBykey1? cfinfoBykey;
  int? similar;

  Cfinfo({
    this.title,
    this.jumpurl,
    this.jumpkey,
    this.cfinfoBykey,
    this.similar,
  });

  Cfinfo.fromJson(Map<String, dynamic> json) {
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["jumpurl"] is String) {
      jumpurl = json["jumpurl"];
    }
    if (json["jumpkey"] is String) {
      jumpkey = json["jumpkey"];
    }
    if (json["cfinfo_bykey"] is Map) {
      cfinfoBykey =
          json["cfinfo_bykey"] == null
              ? null
              : CfinfoBykey1.fromJson(json["cfinfo_bykey"]);
    }
    if (json["similar"] is int) {
      similar = json["similar"];
    }
  }

  static List<Cfinfo> fromList(List<Map<String, dynamic>> list) {
    return list.map(Cfinfo.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["jumpurl"] = jumpurl;
    _data["jumpkey"] = jumpkey;
    if (cfinfoBykey != null) {
      _data["cfinfo_bykey"] = cfinfoBykey?.toJson();
    }
    _data["similar"] = similar;
    return _data;
  }
}

class CfinfoBykey1 {
  String? urlKey;
  String? urlParams;

  CfinfoBykey1({this.urlKey, this.urlParams});

  CfinfoBykey1.fromJson(Map<String, dynamic> json) {
    if (json["url_key"] is String) {
      urlKey = json["url_key"];
    }
    if (json["url_params"] is String) {
      urlParams = json["url_params"];
    }
  }

  static List<CfinfoBykey1> fromList(List<Map<String, dynamic>> list) {
    return list.map(CfinfoBykey1.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["url_key"] = urlKey;
    _data["url_params"] = urlParams;
    return _data;
  }
}

class Backpic {
  String? picurl;
  int? type;
  String? title;

  Backpic({this.picurl, this.type, this.title});

  Backpic.fromJson(Map<String, dynamic> json) {
    if (json["picurl"] is String) {
      picurl = json["picurl"];
    }
    if (json["type"] is int) {
      type = json["type"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
  }

  static List<Backpic> fromList(List<Map<String, dynamic>> list) {
    return list.map(Backpic.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["picurl"] = picurl;
    _data["type"] = type;
    _data["title"] = title;
    return _data;
  }
}

class Listeninfo {
  String? iconurl;
  String? jumpurl;
  String? jumpkey;
  ListenBykey? listenBykey;

  Listeninfo({this.iconurl, this.jumpurl, this.jumpkey, this.listenBykey});

  Listeninfo.fromJson(Map<String, dynamic> json) {
    if (json["iconurl"] is String) {
      iconurl = json["iconurl"];
    }
    if (json["jumpurl"] is String) {
      jumpurl = json["jumpurl"];
    }
    if (json["jumpkey"] is String) {
      jumpkey = json["jumpkey"];
    }
    if (json["listen_bykey"] is Map) {
      listenBykey =
          json["listen_bykey"] == null
              ? null
              : ListenBykey.fromJson(json["listen_bykey"]);
    }
  }

  static List<Listeninfo> fromList(List<Map<String, dynamic>> list) {
    return list.map(Listeninfo.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["iconurl"] = iconurl;
    _data["jumpurl"] = jumpurl;
    _data["jumpkey"] = jumpkey;
    if (listenBykey != null) {
      _data["listen_bykey"] = listenBykey?.toJson();
    }
    return _data;
  }
}

class ListenBykey {
  String? urlKey;
  String? urlParams;

  ListenBykey({this.urlKey, this.urlParams});

  ListenBykey.fromJson(Map<String, dynamic> json) {
    if (json["url_key"] is String) {
      urlKey = json["url_key"];
    }
    if (json["url_params"] is String) {
      urlParams = json["url_params"];
    }
  }

  static List<ListenBykey> fromList(List<Map<String, dynamic>> list) {
    return list.map(ListenBykey.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["url_key"] = urlKey;
    _data["url_params"] = urlParams;
    return _data;
  }
}

class Medal {
  int? flag;
  String? iconurl;
  String? jumpurl;
  String? jumpkey;
  MedalBykey? medalBykey;

  Medal({this.flag, this.iconurl, this.jumpurl, this.jumpkey, this.medalBykey});

  Medal.fromJson(Map<String, dynamic> json) {
    if (json["flag"] is int) {
      flag = json["flag"];
    }
    if (json["iconurl"] is String) {
      iconurl = json["iconurl"];
    }
    if (json["jumpurl"] is String) {
      jumpurl = json["jumpurl"];
    }
    if (json["jumpkey"] is String) {
      jumpkey = json["jumpkey"];
    }
    if (json["medal_bykey"] is Map) {
      medalBykey =
          json["medal_bykey"] == null
              ? null
              : MedalBykey.fromJson(json["medal_bykey"]);
    }
  }

  static List<Medal> fromList(List<Map<String, dynamic>> list) {
    return list.map(Medal.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["flag"] = flag;
    _data["iconurl"] = iconurl;
    _data["jumpurl"] = jumpurl;
    _data["jumpkey"] = jumpkey;
    if (medalBykey != null) {
      _data["medal_bykey"] = medalBykey?.toJson();
    }
    return _data;
  }
}

class MedalBykey {
  String? urlKey;
  String? urlParams;

  MedalBykey({this.urlKey, this.urlParams});

  MedalBykey.fromJson(Map<String, dynamic> json) {
    if (json["url_key"] is String) {
      urlKey = json["url_key"];
    }
    if (json["url_params"] is String) {
      urlParams = json["url_params"];
    }
  }

  static List<MedalBykey> fromList(List<Map<String, dynamic>> list) {
    return list.map(MedalBykey.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["url_key"] = urlKey;
    _data["url_params"] = urlParams;
    return _data;
  }
}

class UserInfoUi {
  Nickname? nickname;
  List<Iconlist>? iconlist;

  UserInfoUi({this.nickname, this.iconlist});

  UserInfoUi.fromJson(Map<String, dynamic> json) {
    if (json["nickname"] is Map) {
      nickname =
          json["nickname"] == null ? null : Nickname.fromJson(json["nickname"]);
    }
    if (json["iconlist"] is List) {
      iconlist =
          json["iconlist"] == null
              ? null
              : (json["iconlist"] as List)
                  .map((e) => Iconlist.fromJson(e))
                  .toList();
    }
  }

  static List<UserInfoUi> fromList(List<Map<String, dynamic>> list) {
    return list.map(UserInfoUi.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (nickname != null) {
      _data["nickname"] = nickname?.toJson();
    }
    if (iconlist != null) {
      _data["iconlist"] = iconlist?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Iconlist {
  int? width;
  int? height;
  String? srcUrl;
  String? style;
  String? ext;
  String? desc;

  Iconlist({
    this.width,
    this.height,
    this.srcUrl,
    this.style,
    this.ext,
    this.desc,
  });

  Iconlist.fromJson(Map<String, dynamic> json) {
    if (json["width"] is int) {
      width = json["width"];
    }
    if (json["height"] is int) {
      height = json["height"];
    }
    if (json["srcUrl"] is String) {
      srcUrl = json["srcUrl"];
    }
    if (json["style"] is String) {
      style = json["style"];
    }
    if (json["ext"] is String) {
      ext = json["ext"];
    }
    if (json["desc"] is String) {
      desc = json["desc"];
    }
  }

  static List<Iconlist> fromList(List<Map<String, dynamic>> list) {
    return list.map(Iconlist.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["width"] = width;
    _data["height"] = height;
    _data["srcUrl"] = srcUrl;
    _data["style"] = style;
    _data["ext"] = ext;
    _data["desc"] = desc;
    return _data;
  }
}

class Nickname {
  String? lightColor;
  String? darkColor;

  Nickname({this.lightColor, this.darkColor});

  Nickname.fromJson(Map<String, dynamic> json) {
    if (json["lightColor"] is String) {
      lightColor = json["lightColor"];
    }
    if (json["darkColor"] is String) {
      darkColor = json["darkColor"];
    }
  }

  static List<Nickname> fromList(List<Map<String, dynamic>> list) {
    return list.map(Nickname.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["lightColor"] = lightColor;
    _data["darkColor"] = darkColor;
    return _data;
  }
}

class Lvinfo {
  String? iconurl;
  String? jumpurl;
  String? jumpkey;
  LvinfoBykey? lvinfoBykey;

  Lvinfo({this.iconurl, this.jumpurl, this.jumpkey, this.lvinfoBykey});

  Lvinfo.fromJson(Map<String, dynamic> json) {
    if (json["iconurl"] is String) {
      iconurl = json["iconurl"];
    }
    if (json["jumpurl"] is String) {
      jumpurl = json["jumpurl"];
    }
    if (json["jumpkey"] is String) {
      jumpkey = json["jumpkey"];
    }
    if (json["lvinfo_bykey"] is Map) {
      lvinfoBykey =
          json["lvinfo_bykey"] == null
              ? null
              : LvinfoBykey.fromJson(json["lvinfo_bykey"]);
    }
  }

  static List<Lvinfo> fromList(List<Map<String, dynamic>> list) {
    return list.map(Lvinfo.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["iconurl"] = iconurl;
    _data["jumpurl"] = jumpurl;
    _data["jumpkey"] = jumpkey;
    if (lvinfoBykey != null) {
      _data["lvinfo_bykey"] = lvinfoBykey?.toJson();
    }
    return _data;
  }
}

class LvinfoBykey {
  String? urlKey;
  String? urlParams;

  LvinfoBykey({this.urlKey, this.urlParams});

  LvinfoBykey.fromJson(Map<String, dynamic> json) {
    if (json["url_key"] is String) {
      urlKey = json["url_key"];
    }
    if (json["url_params"] is String) {
      urlParams = json["url_params"];
    }
  }

  static List<LvinfoBykey> fromList(List<Map<String, dynamic>> list) {
    return list.map(LvinfoBykey.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["url_key"] = urlKey;
    _data["url_params"] = urlParams;
    return _data;
  }
}

class Typeinfo {
  int? type;
  String? jumpurl;
  CfinfoBykey? cfinfoBykey;
  String? jumpkey;
  String? iconurl;

  Typeinfo({
    this.type,
    this.jumpurl,
    this.cfinfoBykey,
    this.jumpkey,
    this.iconurl,
  });

  Typeinfo.fromJson(Map<String, dynamic> json) {
    if (json["type"] is int) {
      type = json["type"];
    }
    if (json["jumpurl"] is String) {
      jumpurl = json["jumpurl"];
    }
    if (json["cfinfo_bykey"] is Map) {
      cfinfoBykey =
          json["cfinfo_bykey"] == null
              ? null
              : CfinfoBykey.fromJson(json["cfinfo_bykey"]);
    }
    if (json["jumpkey"] is String) {
      jumpkey = json["jumpkey"];
    }
    if (json["iconurl"] is String) {
      iconurl = json["iconurl"];
    }
  }

  static List<Typeinfo> fromList(List<Map<String, dynamic>> list) {
    return list.map(Typeinfo.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["type"] = type;
    _data["jumpurl"] = jumpurl;
    if (cfinfoBykey != null) {
      _data["cfinfo_bykey"] = cfinfoBykey?.toJson();
    }
    _data["jumpkey"] = jumpkey;
    _data["iconurl"] = iconurl;
    return _data;
  }
}

class CfinfoBykey {
  String? urlKey;
  String? urlParams;

  CfinfoBykey({this.urlKey, this.urlParams});

  CfinfoBykey.fromJson(Map<String, dynamic> json) {
    if (json["url_key"] is String) {
      urlKey = json["url_key"];
    }
    if (json["url_params"] is String) {
      urlParams = json["url_params"];
    }
  }

  static List<CfinfoBykey> fromList(List<Map<String, dynamic>> list) {
    return list.map(CfinfoBykey.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["url_key"] = urlKey;
    _data["url_params"] = urlParams;
    return _data;
  }
}

class ShareBykey {
  String? urlKey;
  String? urlParams;

  ShareBykey({this.urlKey, this.urlParams});

  ShareBykey.fromJson(Map<String, dynamic> json) {
    if (json["url_key"] is String) {
      urlKey = json["url_key"];
    }
    if (json["url_params"] is String) {
      urlParams = json["url_params"];
    }
  }

  static List<ShareBykey> fromList(List<Map<String, dynamic>> list) {
    return list.map(ShareBykey.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["url_key"] = urlKey;
    _data["url_params"] = urlParams;
    return _data;
  }
}

class Singerinfo {
  int? singerid;

  Singerinfo({this.singerid});

  Singerinfo.fromJson(Map<String, dynamic> json) {
    if (json["singerid"] is int) {
      singerid = json["singerid"];
    }
  }

  static List<Singerinfo> fromList(List<Map<String, dynamic>> list) {
    return list.map(Singerinfo.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["singerid"] = singerid;
    return _data;
  }
}
