import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart' show ScrollController;
import 'package:meta/meta.dart';

part 'scroll_event.dart';
part 'scroll_state.dart';

class ScrollBloc extends Bloc<ScrollEvent, ScrollState> {
  ScrollBloc() : super(ScrollInitial(null)) {
    on<ScrollEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ScrollLoadedEvent>((event, emit) {
      emit(ScrollInitial(event.controller));
    });
  }
}
