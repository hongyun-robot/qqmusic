part of 'music_bloc.dart';

@immutable
sealed class MusicState {}

final class MusicInitial extends MusicState {}

class CurrentMusicState extends MusicState {
  final Songlist data;
  CurrentMusicState(this.data);
}

class CurrentMusicInfoState extends MusicState {
  final Song data;
  CurrentMusicInfoState(this.data);
}
