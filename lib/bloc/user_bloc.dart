import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qqmusic/api/user/user.dart';
import 'package:qqmusic/model/m_detail.dart';
import 'package:qqmusic/tools/logger.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<UserLoadedEvent>((event, emit) async {
      final user = await UserApi().detail();
      if (user.result == 100) {
        Logger.instance.i('user info 获取成功');
        emit(UserLoginState(isLogin: true));
        emit(UserLoaded(user));
      } else {
        Logger.instance.e(user.errMsg);
        emit(UserLoginState(isLogin: false));
      }
    });
  }
}
