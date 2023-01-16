import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'chess_clock_event.dart';
part 'chess_clock_state.dart';

class ChessClockBloc extends Bloc<ChessClockEvent, ChessClockState> {
  ChessClockBloc() : super(ChessClockInitial()) {
    on<ChessClockEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
