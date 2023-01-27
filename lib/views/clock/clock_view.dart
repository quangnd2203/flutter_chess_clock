import 'dart:math';

import 'package:demo_bloc/views/clock/time_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../blocs/chess_clock_bloc/chess_clock_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClockView extends StatelessWidget {
  ClockView({Key? key}) : super(key: key);

  final ChessClockBloc clockBloc = Get.put<ChessClockBloc>(ChessClockBloc());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  clockBloc.add(ChessClockRun2());
                },
                child: Transform.rotate(
                  angle: pi,
                  child: TimeView(
                    timeBloc: clockBloc.timeBloc1,
                  ),
                ),
              ),
            ),
            buildSettings(),
            Expanded(
              child: InkWell(
                onTap: () {
                  clockBloc.add(ChessClockRun1());
                },
                child: TimeView(
                  timeBloc: clockBloc.timeBloc2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSettings() {
    return Container(
      color: Colors.black.withOpacity(0.9),
      height: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildButtonSetting(Icons.refresh, (){
            clockBloc.add(ChessClockReset());
          }),
          const SizedBox(
            width: 20,
          ),
          playState(),
          const SizedBox(
            width: 50,
          ),
          buildButtonSetting(Icons.timer_outlined),
          const SizedBox(
            width: 20,
          ),
          soundState(),
        ],
      ),
    );
  }

  Widget buildButtonSetting(IconData icon, [VoidCallback? onPressed]) {
    return IconButton(
      onPressed: onPressed ?? () {},
      icon: Icon(icon),
      color: Colors.white,
      iconSize: 33,
      splashRadius: 1,
    );
  }

  Widget playState() {
    return BlocConsumer(
      bloc: clockBloc,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ChessClockStopState) {
          return const SizedBox();
        }
        if (state is ChessClockStartState) {
          return buildButtonSetting(Icons.pause, (){
            clockBloc.add(ChessClockPause());
          });
        }
        if (state is ChessClockPauseState || state is ChessClockInitial) {
          return buildButtonSetting(Icons.play_arrow, (){
            clockBloc.add(ChessClockStart());
          });
        }
        return const SizedBox();
      },
    );
  }

  Widget soundState() {
    return buildButtonSetting(true ? Icons.volume_up : Icons.volume_off);
  }
}
