import 'dart:convert' show Base64Decoder, jsonDecode;
import 'dart:io';
import 'dart:typed_data';

import 'package:qqmusic/api/request.dart';
import 'package:qqmusic/bloc/user_bloc.dart' show UserBloc, UserLoadedEvent;
import 'package:qqmusic/model/check_login_qr.dart';
import 'package:qqmusic/model/cookie.dart';
import 'package:qqmusic/model/login_qr.dart' show LoginQr;
import 'package:qqmusic/model/m_detail.dart';
import 'package:qqmusic/model/refresh.dart';
import 'package:qqmusic/net/network_manager.dart' show NetworkManager;
import 'package:qqmusic/net/response/base_response.dart';
import 'package:qqmusic/tools/constant.dart' show cookiePathDirName;
import 'package:qqmusic/tools/logger.dart';
import 'package:qqmusic/tools/path.dart' show PathHelper;

class UserApi extends Request {
  /// 单例
  static final UserApi _instance = UserApi._internal();
  UserApi._internal();

  factory UserApi() {
    return _instance;
  }

  init() async {
    File file = File('${PathHelper().getHomePath}/$cookiePathDirName');
    if (file.existsSync()) {
      String value = await file.readAsString();
      QCookie().fromJson(jsonDecode(value));
      id = QCookie().uin;
      // Refresh refreshV = await refresh();
      // Logger.instance.d('refresh.result: ${refreshV.result}');
      // if (refreshV.result != 100) {
      //   QCookie().clear();
      // } else {
      // QCookie().fromJson({'qqmusic_key': refreshV.data!.musickey});
      // QCookie.getCookieFile().writeAsString(QCookie().toString());
      // final userBloc = UserBloc();
      // userBloc.add(UserLoadedEvent());
      // userBloc.stream.listen((state) {
      //   // print('current state: ${state}');
      //   Logger.instance.d('current state ${state.toString()}');
      // });
      // }
    }
  }

  @override
  final String baseAddr = '/user';
  int? ptqrtoken;
  String? qrsig;

  String? id;

  Future<Uint8List> getLoginQr() async {
    var value = await NetworkManager().request(
      getUrl('/getLoginQr/qq'),
      isCookie: true,
    );
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

  Future<Refresh> refresh() async {
    final value = await NetworkManager().request(
      getUrl('/refresh'),
      isCookie: true,
    );
    return Refresh.fromJson(value.data);
  }

  Future<Mdetail> detail() async {
    final value = await NetworkManager().request(
      getUrl('/detail'),
      isCookie: true,
      params: {'id': id},
    );
    return Mdetail.fromJson(value.data);
  }
}
