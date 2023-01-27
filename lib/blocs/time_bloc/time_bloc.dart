import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

import '../chess_clock_bloc/chess_clock_bloc.dart';

part 'time_event.dart';
part 'time_state.dart';

class TimeBloc extends Bloc<TimeEvent, TimeState> {
  final Duration initialDuration;
  Timer? _timer;
  late Duration _duration;
  ChessClockBloc get clockBloc => Get.find<ChessClockBloc>();

  TimeBloc(this.initialDuration) : super(TimeStartState(initialDuration)) {
    _duration = initialDuration;
    on<StartEvent>(_onStartEvent);
    on<RunEvent>(_onDecreaseTime);
    on<RunningEvent>(_onRunningTime);
    on<PauseEvent>(_onPauseTime);
    on<StopEvent>(_onStopEvent);
    on<ResetEvent>(_onResetEvent);
  }

  Future<void> _onStartEvent(StartEvent event, Emitter<TimeState> emit) async {
    emit(TimeStartState(_duration));
  }

  Future<void> _onDecreaseTime(RunEvent event, Emitter<TimeState> emit) async {
    const Duration duration = Duration(milliseconds: 10);
    _timer = Timer.periodic(duration, (timer) {
      _duration -= duration;
      if(!(_duration.inSeconds <= 0)) {
        add(RunningEvent());
      } else {
        add(StopEvent());
      }
    });
  }

  Future<void> _onRunningTime(RunningEvent event, Emitter<TimeState> emit) async {
    emit(TimeRunState(_duration));
  }

  Future<void> _onPauseTime(PauseEvent event, Emitter<TimeState> emit) async {
    _timer?.cancel();
    emit(TimePauseState(_duration));
  }

  Future<void> _onStopEvent(StopEvent event, Emitter<TimeState> emit) async {
    _timer?.cancel();
    emit(const TimeCompleteState());
    clockBloc.add(ChessClockStop());
  }

  Future<void> _onResetEvent(ResetEvent event, Emitter<TimeState> emit) async {
    _timer?.cancel();
    _duration = initialDuration;
    emit(TimeStartState(initialDuration));
  }
}
