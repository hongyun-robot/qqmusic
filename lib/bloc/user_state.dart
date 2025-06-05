part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

class UserLoaded extends UserState {
  final Mdetail userInfo;
  UserLoaded(this.userInfo);
}
