import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qqmusic/api/song/song.dart' show SongApi;
import 'package:qqmusic/model/song/song.dart';
import 'package:qqmusic/model/songlist/collect_song.dart';

part 'music_event.dart';
part 'music_state.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  MusicBloc() : super(MusicInitial()) {
    // 添加状态变更监听
    @override
    void onChange(Change<MusicState> change) {
      super.onChange(change);
      print(change);
    }

    on<MusicEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<CurrentMusicStateEvent>((event, emit) async {
      emit(CurrentMusicState(event.data));
      Song data = await SongApi().info(event.data.mid);
      if (data.result == 100) {
        emit(
          CurrentMusicInfoState(
            data: data,
            listData: event.listData,
            curMusicInIndex: event.listData.indexWhere(
              (v) => v.id == event.data.id,
            ),
          ),
        );
      }
    });
    // on<CurrentMusicListStateEvent>((event, emit) {
    //   emit(
    //     CurrentMusicListState(
    //       listData: event.listData,
    //       curMusicInIndex: event.listData.indexWhere(
    //         (v) => v.id == event.data.id,
    //       ),
    //     ),
    //   );
    // });
    on<CurMusicAddEvent>((event, emit) async {
      if (state is CurrentMusicInfoState) {
        final curState = (state as CurrentMusicInfoState);
        int index = curState.curMusicInIndex;
        final listData = curState.listData;
        if (listData == null || index == -1) return;
        if ((index + 1) == listData.length) {
          index = 0;
        } else {
          index++;
        }
        final data = listData[index];
        emit(CurrentMusicState(data));
        Song res = await SongApi().info(data.mid);
        if (res.result == 100) {
          emit(
            CurrentMusicInfoState(
              data: res,
              listData: curState.listData,
              curMusicInIndex: index,
            ),
          );
        }
      }
    });
    on<CurMusicSubEvent>((event, emit) async {
      if (state is CurrentMusicInfoState) {
        final curState = (state as CurrentMusicInfoState);
        int index = curState.curMusicInIndex;
        final listData = curState.listData;
        if (listData == null || index == -1) return;
        if (index == 0) {
          index = listData.length - 1;
        } else {
          index--;
        }
        final data = listData[index];
        emit(CurrentMusicState(data));
        Song res = await SongApi().info(data.mid);
        if (res.result == 100) {
          emit(
            CurrentMusicInfoState(
              data: res,
              listData: curState.listData,
              curMusicInIndex: index,
            ),
          );
        }
      }
    });
  }
}
