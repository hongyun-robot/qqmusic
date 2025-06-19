part of 'scroll_bloc.dart';

@immutable
sealed class ScrollState {}

final class ScrollInitial extends ScrollState {
  final ScrollController? controller;
  ScrollInitial(this.controller);
}
