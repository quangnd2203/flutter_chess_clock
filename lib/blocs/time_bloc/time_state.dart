part of 'time_bloc.dart';

abstract class TimeState extends Equatable {
  final Duration duration;

  const TimeState(this.duration);
}

class TimeStartState extends TimeState {
  const TimeStartState(super.duration);

  @override
  List<Object> get props => [duration];
}

class TimeRunState extends TimeState {
  const TimeRunState(super.duration);

  @override
  List<Object> get props => [duration];
}

class TimePauseState extends TimeState {
  const TimePauseState(super.duration);

  @override
  List<Object> get props => [duration];
}

class TimeCompleteState extends TimeState {
  const TimeCompleteState() : super(Duration.zero);
  
  @override
  List<Object> get props => [duration];
}
