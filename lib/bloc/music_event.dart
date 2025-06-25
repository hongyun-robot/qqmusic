part of 'music_bloc.dart';

@immutable
sealed class MusicEvent {}

class CurrentMusicStateEvent extends MusicEvent {
  final Songlist data;
  CurrentMusicStateEvent(this.data);
}

class CurrentMusicInfoStateEvent extends MusicEvent {}
