part of 'scroll_bloc.dart';

@immutable
sealed class ScrollEvent {}

class ScrollLoadedEvent extends ScrollEvent {
  final ScrollController controller;
  ScrollLoadedEvent(this.controller);
}
