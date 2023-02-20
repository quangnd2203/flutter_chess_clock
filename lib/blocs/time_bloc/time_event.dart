part of 'time_bloc.dart';

abstract class TimeEvent{
  const TimeEvent();
}

class StartEvent extends TimeEvent{}

class RunEvent extends TimeEvent{}

class RunningEvent extends TimeEvent{}

class PauseEvent extends TimeEvent{}

class ResetEvent extends TimeEvent{
  final Duration? duration;

  ResetEvent({this.duration});
}

class StopEvent extends TimeEvent{}
