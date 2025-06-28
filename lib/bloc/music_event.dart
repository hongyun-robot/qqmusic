part of 'music_bloc.dart';

@immutable
sealed class MusicEvent {}

class CurrentMusicStateEvent extends MusicEvent {
  final Songlist data;
  final List<Songlist>? listData;
  final Dirinfo? dirinfo;
  CurrentMusicStateEvent(this.data, {this.listData, this.dirinfo});
}

class CurMusicAddEvent extends MusicEvent {}

class CurMusicSubEvent extends MusicEvent {}

class CurrentPlayListEvent extends MusicEvent {
  final List<Songlist> listData;
  final Dirinfo dirinfo;
  CurrentPlayListEvent({required this.listData, required this.dirinfo});
}

class CurrentPlayListInIndexEvent extends MusicEvent {
  final int curMusicInIndex;
  CurrentPlayListInIndexEvent(this.curMusicInIndex);
}

class ReloadRequestMusicEvent extends MusicEvent {
  final bool isReloadRequest;
  ReloadRequestMusicEvent(this.isReloadRequest);
}
