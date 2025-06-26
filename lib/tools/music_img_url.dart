import 'package:qqmusic/model/song/song.dart' show TrackInfo;

String getMusicImageUrl(TrackInfo data) {
  bool isAlbum = data.album.id != 0;
  return 'https://y.qq.com/music/photo_new/T0${isAlbum ? 0 : 6}2R300x300M000${isAlbum ? data.album.pmid : data.vs[1]}.jpg?max_age=2592000';
}
