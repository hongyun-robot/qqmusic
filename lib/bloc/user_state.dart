part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

class UserLoaded extends UserState {
  final Mdetail userInfo;
  UserLoaded(this.userInfo);
}

class UserLoginState extends UserState {
  final bool isLogin;
  UserLoginState({this.isLogin = false});
}
