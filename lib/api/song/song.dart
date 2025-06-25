import 'package:qqmusic/api/request.dart' show Request;
import 'package:qqmusic/const/const.dart' show SongType;
import 'package:qqmusic/model/cookie.dart' show QCookie;
import 'package:qqmusic/model/song/song.dart';
import 'package:qqmusic/model/song/song_url.dart';
import 'package:qqmusic/net/network_manager.dart' show NetworkManager;

class SongApi extends Request {
  /// 单例
  static final SongApi _instance = SongApi._internal();
  SongApi._internal();

  factory SongApi() {
    return _instance;
  }

  init() {
    id = QCookie().uin;
  }

  @override
  final String baseAddr = '/song';
  String? id;

  /// 根据 id 获取歌曲信息
  /// id mid
  Future<Song> info(String id) async {
    final value = await NetworkManager().request(
      getUrl(''),
      isCookie: true,
      params: {'songmid': id},
    );
    return Song.fromJson(value.data);
  }

  /// 根据 id 获取歌曲播放链接
  ///
  /// id： mid
  ///
  /// type：歌曲品质
  ///
  /// encrypted： 0 不加密， 1 加密
  Future<SongUrl> url(String id, SongType type, int encrypted) async {
    final value = await NetworkManager().request(
      getUrl('/url'),
      isCookie: true,
      params: {'id': id, 'type': type.type, 'encrypted': encrypted},
    );
    return SongUrl.fromJson(value.data);
  }
}
