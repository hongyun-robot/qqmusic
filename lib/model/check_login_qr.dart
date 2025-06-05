import 'package:qqmusic/model/cookie.dart';

class CheckLoginQr {
  late bool isOk;
  late int code;
  QCookie? result;
  bool? refresh;
  late String message;

  CheckLoginQr({
    required this.isOk,
    required this.code,
    this.result,
    this.refresh,
    required this.message,
  });

  CheckLoginQr.fromJson(Map<String, dynamic> json) {
    if (json["isOk"] is bool) {
      isOk = json["isOk"];
    }
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["result"] is Map) {
      result =
          json["result"] == null
              ? null
              : QCookie.fromJsonStatic(json["result"]);
    }
    if (json["refresh"] is bool) {
      refresh = json["refresh"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
  }

  static List<CheckLoginQr> fromList(List<Map<String, dynamic>> list) {
    return list.map(CheckLoginQr.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["isOk"] = isOk;
    _data["code"] = code;
    _data["result"] = result;
    _data["refresh"] = refresh;
    _data["message"] = message;
    return _data;
  }
}
