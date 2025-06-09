part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class UserLoadedEvent extends UserEvent {}

class UserLoginStateEvent extends UserEvent {
  final bool isLogin;
  UserLoginStateEvent(this.isLogin);
}
