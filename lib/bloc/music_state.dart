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
  final List<Songlist>? listData;
  final int _curMusicInIndex;

  get curMusicInIndex => _curMusicInIndex;
  CurrentMusicInfoState({
    required this.data,
    this.listData,
    int curMusicInIndex = -1,
  }) : _curMusicInIndex = curMusicInIndex;
}

class CurrentMusicListState extends MusicState {}
