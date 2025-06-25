import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qqmusic/api/song/song.dart' show SongApi;
import 'package:qqmusic/model/song/song.dart';
import 'package:qqmusic/model/songlist/collect_song.dart';

part 'music_event.dart';
part 'music_state.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  MusicBloc() : super(MusicInitial()) {
    on<MusicEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<CurrentMusicStateEvent>((event, emit) async {
      emit(CurrentMusicState(event.data));
      Song data = await SongApi().info(event.data.mid);
      emit(CurrentMusicInfoState(data));
    });
  }
}
