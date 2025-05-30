class CheckLoginQr {
  late bool isOk;
  late int result;
  bool? refresh;
  late String message;

  CheckLoginQr({
    required this.isOk,
    required this.result,
    this.refresh,
    required this.message,
  });

  CheckLoginQr.fromJson(Map<String, dynamic> json) {
    if (json["isOk"] is bool) {
      isOk = json["isOk"];
    }
    if (json["result"] is int) {
      result = json["result"];
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
    _data["result"] = result;
    _data["refresh"] = refresh;
    _data["message"] = message;
    return _data;
  }
}
