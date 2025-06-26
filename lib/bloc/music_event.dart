part of 'music_bloc.dart';

@immutable
sealed class MusicEvent {}

class CurrentMusicStateEvent extends MusicEvent {
  final Songlist data;
  final List<Songlist> listData;
  CurrentMusicStateEvent(this.data, this.listData);
}

// class CurrentMusicListStateEvent extends MusicEvent {
//   // final Songlist data;
//   // CurrentMusicListStateEvent(this.data, this.listData);
// }

class CurMusicAddEvent extends MusicEvent {}

class CurMusicSubEvent extends MusicEvent {}
