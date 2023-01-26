import 'package:demo_bloc/blocs/time_bloc/time_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helper.dart';

class TimeView extends StatelessWidget {
  const TimeView({Key? key, required this.timeBloc}) : super(key: key);

  final TimeBloc timeBloc;

  @override
  Widget build(BuildContext context) {
    Widget child = buildTime();
    return BlocConsumer(
      builder: (context, state){
        return Material(
          color: (state is TimeRunState) ? Colors.green : Colors.grey,
          child: Center(
            child: child,
          ),
        );
      },
      bloc: timeBloc,
      listener: (context, state) {},
    );
  }

  Widget buildButton(IconData icon, VoidCallback action, [Color? color]) {
    return IconButton(
      onPressed: action,
      iconSize: 50,
      splashRadius: 0.1,
      color: color,
      icon: Center(
        child: Icon(icon),
      ),
    );
  }

  Widget buildTime() {
    return BlocConsumer(
      builder: (context, TimeState state) {
        return Text(
          formatTime(state.duration),
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 95, color: (state is TimeRunState) ? Colors.white : Colors.black),
        );
      },
      listener: (context, state) {},
      bloc: timeBloc,
    );
  }

  String durationToString(Duration duration) {
    return duration.toString().replaceRange(10, 14, '');
  }
}
