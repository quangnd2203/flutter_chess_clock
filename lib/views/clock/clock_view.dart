import 'dart:math';

import 'package:demo_bloc/blocs/sound_bloc/sound_cubit.dart';
import 'package:demo_bloc/blocs/theme_cubit/theme_cubit.dart';
import 'package:demo_bloc/constants/app_colors.dart';
import 'package:demo_bloc/views/clock/time_view.dart';
import 'package:demo_bloc/views/time_control/time_controls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../blocs/chess_clock_bloc/chess_clock_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClockView extends StatelessWidget {
  ClockView({Key? key}) : super(key: key);

  final ChessClockBloc clockBloc = Get.put<ChessClockBloc>(ChessClockBloc());
  final SoundCubit soundCubit = Get.put<SoundCubit>(SoundCubit());
  final ThemeCubit themeCubit = Get.put<ThemeCubit>(ThemeCubit());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
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
    );
  }

  Widget buildSettings() {
    return Container(
      color: AppColors.black,
      height: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildButtonSetting(Icons.refresh, () {
            clockBloc.add(ChessClockReset());
          }),
          const SizedBox(
            width: 20,
          ),
          playState(),
          const SizedBox(
            width: 50,
          ),
          buildButtonSetting(Icons.timer_outlined, (){
            Get.to(TimeControls());
          }),
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
          return buildButtonSetting(Icons.pause, () {
            clockBloc.add(ChessClockPause());
          });
        }
        if (state is ChessClockPauseState || state is ChessClockInitial) {
          return buildButtonSetting(Icons.play_arrow, () {
            clockBloc.add(ChessClockStart());
          });
        }
        return const SizedBox();
      },
    );
  }

  Widget soundState() {
    return BlocConsumer(
      builder: (context, bool state) {
        return buildButtonSetting(
          state ? Icons.volume_up : Icons.volume_off,
          () => Get.find<SoundCubit>().changeState(!state),
        );
      },
      listener: (state, context) {},
      bloc: soundCubit,
    );
  }
}
