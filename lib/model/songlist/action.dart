class Action {
  late int alert;
  late int msgshare;
  late int msgfav;
  late int msgid;
  late int msgdown;
  late int icons;
  late int msgpay;
  late int switch2;
  late int icon2;
  late int switch1;

  Action({
    required this.alert,
    required this.msgshare,
    required this.msgfav,
    required this.msgid,
    required this.msgdown,
    required this.icons,
    required this.msgpay,
    required this.switch2,
    required this.icon2,
    required this.switch1,
  });

  Action.fromJson(Map<String, dynamic> json) {
    if (json["alert"] is int) {
      alert = json["alert"];
    }
    if (json["msgshare"] is int) {
      msgshare = json["msgshare"];
    }
    if (json["msgfav"] is int) {
      msgfav = json["msgfav"];
    }
    if (json["msgid"] is int) {
      msgid = json["msgid"];
    }
    if (json["msgdown"] is int) {
      msgdown = json["msgdown"];
    }
    if (json["icons"] is int) {
      icons = json["icons"];
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
    if (json["switch1"] is int) {
      switch1 = json["switch1"];
    }
  }

  static List<Action> fromList(List<Map<String, dynamic>> list) {
    return list.map(Action.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["alert"] = alert;
    _data["msgshare"] = msgshare;
    _data["msgfav"] = msgfav;
    _data["msgid"] = msgid;
    _data["msgdown"] = msgdown;
    _data["icons"] = icons;
    _data["msgpay"] = msgpay;
    _data["switch2"] = switch2;
    _data["icon2"] = icon2;
    _data["switch1"] = switch1;
    return _data;
  }
}
