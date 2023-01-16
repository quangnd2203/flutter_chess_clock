import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'time_event.dart';
part 'time_state.dart';

class TimeBloc extends Bloc<TimeEvent, TimeState> {
  final Duration initialDuration;
  late Timer _timer;
  late Duration _duration;

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
    const Duration duration = Duration(milliseconds: 100);
    _timer = Timer.periodic(duration, (timer) {
      _duration -= duration;
      if(!(_duration.isNegative)) {
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
    _timer.cancel();
    emit(TimePauseState(_duration));
  }

  Future<void> _onStopEvent(StopEvent event, Emitter<TimeState> emit) async {
    _timer.cancel();
    emit(TimeCompleteState());
  }

  Future<void> _onResetEvent(ResetEvent event, Emitter<TimeState> emit) async {
    _timer.cancel();
    _duration = initialDuration;
    emit(TimeStartState(initialDuration));
  }
}
