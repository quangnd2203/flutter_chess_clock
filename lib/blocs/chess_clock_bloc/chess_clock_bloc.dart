import 'package:bloc/bloc.dart';
import 'package:demo_bloc/helper.dart';
import 'package:meta/meta.dart';

import '../time_bloc/time_bloc.dart';

part 'chess_clock_event.dart';
part 'chess_clock_state.dart';

class ChessClockBloc extends Bloc<ChessClockEvent, ChessClockState> {
  late final TimeBloc timeBloc1;
  late final TimeBloc timeBloc2;

  ChessClockBloc() : super(ChessClockInitial()) {
    on<ChessClockStart>(_onChessClockStart);
    on<ChessClockPause>(_onChessClockPause);
    on<ChessClockStop>(_onChessClockStop);
    on<ChessClockReset>(_onChessClockReset);
    on<ChessClockRun1>(_onChessClockRun1);
    on<ChessClockRun2>(_onChessClockRun2);
    timeBloc1 = TimeBloc(const Duration(seconds: 10));
    timeBloc2 = TimeBloc(const Duration(seconds: 10));
  }

  _onChessClockStart(ChessClockStart event, Emitter<ChessClockState> emit) {
    emit(ChessClockStartState());
  }

  _onChessClockPause(ChessClockPause event, Emitter<ChessClockState> emit) {
    emit(ChessClockPauseState());
    timeBloc1.add(PauseEvent());
    timeBloc2.add(PauseEvent());
  }

  _onChessClockStop(ChessClockStop event, Emitter<ChessClockState> emit) {
    emit(ChessClockStopState());
  }

  _onChessClockReset(ChessClockReset event, Emitter<ChessClockState> emit) async {
    if(state is! ChessClockStopState) {
      add(ChessClockPause());
    }
    final _ = await confirm('Reset the clock?');
    if(_ == true){
      emit(ChessClockInitial());
      timeBloc1.add(ResetEvent());
      timeBloc2.add(ResetEvent());
    }
  }

  _onChessClockRun1(ChessClockRun1 event, Emitter<ChessClockState> emit) {
    if (state is ChessClockStopState) return;
    if (timeBloc2.state is TimeRunState) return;
    if (state is! ChessClockStart) {
      emit(ChessClockStartState());
    }
    timeBloc1.add(PauseEvent());
    timeBloc2.add(RunEvent());
  }

  _onChessClockRun2(ChessClockRun2 event, Emitter<ChessClockState> emit) {
    if (state is ChessClockStopState) return;
    if (timeBloc1.state is TimeRunState) return;
    if (state is! ChessClockStart) {
      emit(ChessClockStartState());
    }
    timeBloc2.add(PauseEvent());
    timeBloc1.add(RunEvent());
  }
}
