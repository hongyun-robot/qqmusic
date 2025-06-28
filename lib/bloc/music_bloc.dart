import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qqmusic/api/song/song.dart' show SongApi;
import 'package:qqmusic/model/song/song.dart';
import 'package:qqmusic/model/songlist/collect_song.dart';

part 'music_event.dart';
part 'music_state.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  List<Songlist>? listData;
  Dirinfo? dirinfo;
  int curMusicInIndex = -1;
  // 添加状态变更监听
  @override
  void onChange(Change<MusicState> change) {
    super.onChange(change);
    print(change);
    if (state is CurrentPlayListState) {
      listData = (state as CurrentPlayListState).listData;
      dirinfo = (state as CurrentPlayListState).dirinfo;
    }

    if (state is CurrentPlayListInIndexState) {
      curMusicInIndex = (state as CurrentPlayListInIndexState)._curMusicInIndex;
    }
  }

  MusicBloc() : super(MusicInitial()) {
    on<MusicEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<CurrentMusicStateEvent>((event, emit) async {
      emit(CurrentMusicState(event.data));
      Song data = await SongApi().info(event.data.mid);
      if (data.result == 100) {
        emit(CurrentMusicInfoState(data: data));
        // if (event.listData != null) {
        //   emit(
        //     CurrentPlayListState(
        //       listData: event.listData,
        //       dirinfo: event.dirinfo,
        //     ),
        //   );
        //   emit(
        //     CurrentPlayListInIndexState(
        //       curMusicInIndex: event.listData!.indexWhere(
        //         (v) => v.id == event.data.id,
        //       ),
        //     ),
        //   );
        // } else {
        //   if (listData != null) {
        //     emit(CurrentPlayListState(listData: listData, dirinfo: dirinfo));
        //     emit(
        //       CurrentPlayListInIndexState(
        //         curMusicInIndex: listData!.indexWhere(
        //           (v) => v.id == event.data.id,
        //         ),
        //       ),
        //     );
        //   }
        // }
      }
    });
    on<CurMusicAddEvent>((event, emit) async {
      bool isS = state is CurrentPlayListInIndexState;
      if (isS || curMusicInIndex != -1) {
        // final curState = (state as CurrentPlayListInIndexState);
        int index =
            isS
                ? (state as CurrentPlayListInIndexState)._curMusicInIndex
                : curMusicInIndex;
        if (listData == null || index == -1) return;
        if ((index + 1) == listData!.length) {
          index = 0;
        } else {
          index++;
        }
        final data = listData![index];
        emit(CurrentMusicState(data));
        Song res = await SongApi().info(data.mid);
        if (res.result == 100) {
          emit(CurrentMusicInfoState(data: res));
          // emit(CurrentPlayListState(listData: listData, dirinfo: dirinfo));
          emit(CurrentPlayListInIndexState(curMusicInIndex: index));
        }
      }
    });
    on<CurMusicSubEvent>((event, emit) async {
      if (state is CurrentPlayListInIndexState) {
        final curState = (state as CurrentPlayListInIndexState);
        int index = curState.curMusicInIndex;
        if (listData == null || index == -1) return;
        if (index == 0) {
          index = listData!.length - 1;
        } else {
          index--;
        }
        final data = listData![index];
        emit(CurrentMusicState(data));
        Song res = await SongApi().info(data.mid);
        if (res.result == 100) {
          emit(CurrentMusicInfoState(data: res));
          // emit(CurrentPlayListState(listData: listData, dirinfo: dirinfo));
          emit(CurrentPlayListInIndexState(curMusicInIndex: index));
        }
      }
    });

    on<CurrentPlayListEvent>((event, emit) {
      emit(
        CurrentPlayListState(dirinfo: event.dirinfo, listData: event.listData),
      );
    });

    on<CurrentPlayListInIndexEvent>((event, emit) {
      emit(CurrentPlayListInIndexState(curMusicInIndex: event.curMusicInIndex));
    });

    on<ReloadRequestMusicEvent>((event, emit) {
      emit(ReloadRequestMusicState(event.isReloadRequest));
    });
  }
}
