import 'dart:async';

import 'package:bloc/bloc.dart';

class TimeCubit extends Cubit<Duration> {

  late Timer _timer;

  TimeCubit(super.initialState);

  void runTime(){
    const Duration duration = Duration(milliseconds: 100);
    _timer = Timer.periodic(duration, (timer) {
      emit(state - duration);
      if(!(state.isNegative)) {
        // add(RunningEvent());
      } else {
        // add(StopEvent());
      }
    });
  }
}
