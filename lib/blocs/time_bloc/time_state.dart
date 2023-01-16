part of 'time_bloc.dart';

abstract class TimeState extends Equatable {
  const TimeState();
}

class TimeStartState extends TimeState {
  final Duration duration;

  const TimeStartState(this.duration);

  @override
  List<Object> get props => [duration];
}

class TimeRunState extends TimeState {
  final Duration duration;

  const TimeRunState(this.duration);

  @override
  List<Object> get props => [duration];
}

class TimePauseState extends TimeState {
  final Duration duration;

  const TimePauseState(this.duration);

  @override
  List<Object> get props => [duration];
}

class TimeCompleteState extends TimeState{
  final Duration duration = Duration.zero;

  @override
  List<Object> get props => [duration];
}