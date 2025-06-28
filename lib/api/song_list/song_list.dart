import 'package:qqmusic/api/request.dart' show Request;
import 'package:qqmusic/model/cookie.dart' show QCookie;
import 'package:qqmusic/model/songlist/add_and_remove.dart';
import 'package:qqmusic/model/songlist/collect_song.dart' show CollectSong;
import 'package:qqmusic/model/songlist/collect_songlist.dart'
    show CollectSonglist;
import 'package:qqmusic/net/network_manager.dart' show NetworkManager;

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
  final String baseAddr = '/songlist';
  String? id;

  /// # 根据 id 获取歌单
  Future<CollectSong> collectSong(
    int dissid,
    int song_begin,
    int song_num,
  ) async {
    final value = await NetworkManager().request(
      getUrl('/'),
      isCookie: true,
      params: {'id': dissid, 'song_begin': song_begin, 'song_num': song_num},
    );
    return CollectSong.fromJson(value.data);
  }

  /// #收藏或取消歌单
  /// op 1 收藏 2 取消
  Future<CollectSonglist> collect(int dissid, int op) async {
    final value = await NetworkManager().request(
      getUrl('/collect'),
      isCookie: true,
      params: {'id': dissid, 'op': op},
    );
    return CollectSonglist.fromJson(value.data);
  }

  /// # 添加歌曲到歌单
  /// - dirId 歌单id
  /// - songId 歌曲 id 不是 mid
  Future<AddAndRemove> add(int dirId, int songId) async {
    final value = await NetworkManager().request(
      getUrl('/add'),
      isCookie: true,
      params: {'songId': songId, 'dirId': dirId},
    );
    return AddAndRemove.fromJson(value.data);
  }

  /// # 从歌单移除歌曲
  /// - dirId 歌单id
  /// - songId 歌曲 id 不是 mid
  Future<AddAndRemove> remove(int dirId, int songId) async {
    final value = await NetworkManager().request(
      getUrl('/remove'),
      isCookie: true,
      params: {'songId': songId, 'dirId': dirId},
    );
    return AddAndRemove.fromJson(value.data);
  }
}
