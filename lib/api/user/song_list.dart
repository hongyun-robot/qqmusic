import 'package:qqmusic/api/request.dart' show Request;
import 'package:qqmusic/model/cookie.dart' show QCookie;

class SongListApi extends Request {
  /// 单例
  static final SongListApi _instance = SongListApi._internal();
  SongListApi._internal();

  factory SongListApi() {
    return _instance;
  }

  init() {
    id = QCookie().uin;
  }

  @override
  final String baseAddr = '/user';
  String? id;
}
