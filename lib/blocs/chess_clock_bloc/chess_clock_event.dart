part of 'chess_clock_bloc.dart';

@immutable
abstract class ChessClockEvent {}

class ChessClockStart extends ChessClockEvent{}
class ChessClockPause extends ChessClockEvent{}
class ChessClockStop extends ChessClockEvent{}
class ChessClockReset extends ChessClockEvent{}
class ChessClockRun1 extends ChessClockEvent{}
class ChessClockRun2 extends ChessClockEvent{}
