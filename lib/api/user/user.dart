import 'dart:convert' show Base64Decoder;
import 'dart:typed_data';

import 'package:qqmusic/api/request.dart';
import 'package:qqmusic/model/check_login_qr.dart';
import 'package:qqmusic/model/login_qr.dart' show LoginQr;
import 'package:qqmusic/net/network_manager.dart' show NetworkManager;

class UserApi extends Request {
  @override
  final String baseAddr = '/user';
  int? ptqrtoken;
  String? qrsig;

  Future<Uint8List> getLoginQr() async {
    var value = await NetworkManager().request(getUrl('/getLoginQr/qq'));
    LoginQr loginQr = LoginQr.fromJson(value.data);
    ptqrtoken = loginQr.ptqrtoken!;
    qrsig = loginQr.qrsig!;
    String code = loginQr.img!.split(',')[1];
    return Base64Decoder().convert(code);
  }

  Future<CheckLoginQr?> checkLoginQr() async {
    if (ptqrtoken == null || qrsig == null) return null;
    var value = await NetworkManager().request(
      getUrl('/checkLoginQr/qq?ptqrtoken=$ptqrtoken&qrsig=$qrsig'),
    );
    return CheckLoginQr.fromJson(value.data);
  }

  // Fu
}
