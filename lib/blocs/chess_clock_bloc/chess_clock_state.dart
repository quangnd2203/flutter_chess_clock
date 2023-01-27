part of 'chess_clock_bloc.dart';

@immutable
abstract class ChessClockState {}

class ChessClockInitial extends ChessClockState {}

class ChessClockStartState extends ChessClockState {}

class ChessClockPauseState extends ChessClockState {}

class ChessClockStopState extends ChessClockState {}

class ChessClockResetState extends ChessClockState {}
