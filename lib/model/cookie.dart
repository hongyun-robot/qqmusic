class QCookie {
  static final QCookie _instance = QCookie._internal();

  factory QCookie() {
    return _instance;
  }

  QCookie._internal();

  String? pt2Gguin;
  String? superuin;
  String? supertoken;
  String? superkey;
  String? ptRecentUins;
  String? rk;
  String? ptnick1836017030;
  String? ptcz;
  String? pUin;
  String? pt4Token;
  String? pSkey;
  String? ptOauthToken;
  String? ptLoginType;
  String? euin;
  String? qmKeyst;
  String? qqmusicKey;
  String? tmeLoginType;
  String? psrfAccessTokenExpiresAt;
  String? psrfQqopenid;
  String? psrfMusickeyCreatetime;
  String? psrfQqunionid;
  String? psrfQqaccessToken;
  String? musicIgnorePskey;
  String? uin;
  String? psrfQqrefreshToken;

  void fromJson(Map<String, dynamic> json) {
    if (json["pt2gguin"] is String) {
      pt2Gguin = json["pt2gguin"];
    }
    if (json["superuin"] is String) {
      superuin = json["superuin"];
    }
    if (json["supertoken"] is String) {
      supertoken = json["supertoken"];
    }
    if (json["superkey"] is String) {
      superkey = json["superkey"];
    }
    if (json["pt_recent_uins"] is String) {
      ptRecentUins = json["pt_recent_uins"];
    }
    if (json["RK"] is String) {
      rk = json["RK"];
    }
    if (json["ptnick_1836017030"] is String) {
      ptnick1836017030 = json["ptnick_1836017030"];
    }
    if (json["ptcz"] is String) {
      ptcz = json["ptcz"];
    }
    if (json["p_uin"] is String) {
      pUin = json["p_uin"];
    }
    if (json["pt4_token"] is String) {
      pt4Token = json["pt4_token"];
    }
    if (json["p_skey"] is String) {
      pSkey = json["p_skey"];
    }
    if (json["pt_oauth_token"] is String) {
      ptOauthToken = json["pt_oauth_token"];
    }
    if (json["pt_login_type"] is String) {
      ptLoginType = json["pt_login_type"];
    }
    if (json["euin"] is String) {
      euin = json["euin"];
    }
    if (json["qm_keyst"] is String) {
      qmKeyst = json["qm_keyst"];
    }
    if (json["qqmusic_key"] is String) {
      qqmusicKey = json["qqmusic_key"];
    }
    if (json["tmeLoginType"] is String) {
      tmeLoginType = json["tmeLoginType"];
    }
    if (json["psrf_access_token_expiresAt"] is String) {
      psrfAccessTokenExpiresAt = json["psrf_access_token_expiresAt"];
    }
    if (json["psrf_qqopenid"] is String) {
      psrfQqopenid = json["psrf_qqopenid"];
    }
    if (json["psrf_musickey_createtime"] is String) {
      psrfMusickeyCreatetime = json["psrf_musickey_createtime"];
    }
    if (json["psrf_qqunionid"] is String) {
      psrfQqunionid = json["psrf_qqunionid"];
    }
    if (json["psrf_qqaccess_token"] is String) {
      psrfQqaccessToken = json["psrf_qqaccess_token"];
    }
    if (json["music_ignore_pskey"] is String) {
      musicIgnorePskey = json["music_ignore_pskey"];
    }
    if (json["uin"] is String) {
      uin = json["uin"];
    }
    if (json["psrf_qqrefresh_token"] is String) {
      psrfQqrefreshToken = json["psrf_qqrefresh_token"];
    }
  }

  void clear() {
    pt2Gguin = null;
    superuin = null;
    supertoken = null;
    superkey = null;
    ptRecentUins = null;
    rk = null;
    ptnick1836017030 = null;
    ptcz = null;
    pUin = null;
    pt4Token = null;
    pSkey = null;
    ptOauthToken = null;
    ptLoginType = null;
    euin = null;
    qmKeyst = null;
    qqmusicKey = null;
    tmeLoginType = null;
    psrfAccessTokenExpiresAt = null;
    psrfQqopenid = null;
    psrfMusickeyCreatetime = null;
    psrfQqunionid = null;
    psrfQqaccessToken = null;
    musicIgnorePskey = null;
    uin = null;
    psrfQqrefreshToken = null;
  }

  static QCookie fromJsonStatic(Map<String, dynamic> json) {
    final instance = QCookie();
    instance.fromJson(json);
    return instance;
  }

  static List<QCookie> fromList(List<Map<String, dynamic>> list) {
    return list.map(QCookie.fromJsonStatic).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["pt2gguin"] = pt2Gguin;
    _data["superuin"] = superuin;
    _data["supertoken"] = supertoken;
    _data["superkey"] = superkey;
    _data["pt_recent_uins"] = ptRecentUins;
    _data["RK"] = rk;
    _data["ptnick_1836017030"] = ptnick1836017030;
    _data["ptcz"] = ptcz;
    _data["p_uin"] = pUin;
    _data["pt4_token"] = pt4Token;
    _data["p_skey"] = pSkey;
    _data["pt_oauth_token"] = ptOauthToken;
    _data["pt_login_type"] = ptLoginType;
    _data["euin"] = euin;
    _data["qm_keyst"] = qmKeyst;
    _data["qqmusic_key"] = qqmusicKey;
    _data["tmeLoginType"] = tmeLoginType;
    _data["psrf_access_token_expiresAt"] = psrfAccessTokenExpiresAt;
    _data["psrf_qqopenid"] = psrfQqopenid;
    _data["psrf_musickey_createtime"] = psrfMusickeyCreatetime;
    _data["psrf_qqunionid"] = psrfQqunionid;
    _data["psrf_qqaccess_token"] = psrfQqaccessToken;
    _data["music_ignore_pskey"] = musicIgnorePskey;
    _data["uin"] = uin;
    _data["psrf_qqrefresh_token"] = psrfQqrefreshToken;
    return _data;
  }

  @override
  String toString() {
    return toJson().entries.map((el) => '${el.key}=${el.value}; ').join('; ');
  }
}
