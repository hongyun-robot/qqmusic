part of 'music_bloc.dart';

@immutable
sealed class MusicState {}

final class MusicInitial extends MusicState {}

/// 当前播放音乐的数据
class CurrentMusicState extends MusicState {
  final Songlist data;
  CurrentMusicState(this.data);
}

/// 当前播放音乐的信息
class CurrentMusicInfoState extends MusicState {
  final Song data;
  CurrentMusicInfoState({required this.data});
}

/// 当前播放列表
class CurrentPlayListState extends MusicState {
  final List<Songlist>? listData;
  final Dirinfo? dirinfo;

  CurrentPlayListState({this.listData, this.dirinfo});
}

class CurrentPlayListInIndexState extends MusicState {
  final int _curMusicInIndex;
  get curMusicInIndex => _curMusicInIndex;
  CurrentPlayListInIndexState({int curMusicInIndex = -1})
    : _curMusicInIndex = curMusicInIndex;
}

class ReloadRequestMusicState extends MusicState {
  final bool isReloadRequest;
  ReloadRequestMusicState(this.isReloadRequest);
}
