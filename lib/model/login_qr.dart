class LoginQr {
  int? result;
  String? img;
  int? ptqrtoken;
  String? qrsig;

  LoginQr({this.result, this.img, this.ptqrtoken, this.qrsig});

  LoginQr.fromJson(Map<String, dynamic> json) {
    if (json["result"] is int) {
      result = json["result"];
    }
    if (json["img"] is String) {
      img = json["img"];
    }
    if (json["ptqrtoken"] is int) {
      ptqrtoken = json["ptqrtoken"];
    }
    if (json["qrsig"] is String) {
      qrsig = json["qrsig"];
    }
  }

  static List<LoginQr> fromList(List<Map<String, dynamic>> list) {
    return list.map(LoginQr.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["result"] = result;
    _data["img"] = img;
    _data["ptqrtoken"] = ptqrtoken;
    _data["qrsig"] = qrsig;
    return _data;
  }
}
