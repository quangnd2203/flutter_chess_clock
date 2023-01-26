import 'dart:math';

import 'package:demo_bloc/blocs/time_bloc/time_bloc.dart';
import 'package:demo_bloc/views/clock/time_view.dart';
import 'package:flutter/material.dart';

class ClockView extends StatelessWidget {
  ClockView({Key? key}) : super(key: key);

  final TimeBloc timeBloc1 = TimeBloc(const Duration(minutes: 90));
  final TimeBloc timeBloc2 = TimeBloc(const Duration(minutes: 90));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              child: InkWell(
                onTap: (){
                  timeBloc1.add(RunEvent());
                },
                child: Transform.rotate(
                  angle: pi,
                  child: TimeView(
                    timeBloc: timeBloc1,
                  ),
                ),
              ),
            ),
            buildSettings(),
            Expanded(
              child: TimeView(
                timeBloc: timeBloc2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSettings(){
    return Container(
      color: Colors.black.withOpacity(0.9),
      height: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildButtonSetting(Icons.refresh),
          const SizedBox(width: 20,),
          playState(),
          const SizedBox(width: 50,),
          buildButtonSetting(Icons.timer_outlined),
          const SizedBox(width: 20,),
          soundState(),
        ],
      ),
    );
  }

  Widget buildButtonSetting(IconData icon,[VoidCallback? onPressed]){
    return IconButton(onPressed: onPressed ?? (){}, icon: Icon(icon), color: Colors.white, iconSize: 33, splashRadius: 1,);
  }

  Widget playState(){
    return buildButtonSetting(true ? Icons.play_arrow : Icons.pause);
  }

  Widget soundState(){
    return buildButtonSetting(true ? Icons.volume_up : Icons.volume_off);
  }
}
