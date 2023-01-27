import 'package:demo_bloc/blocs/time_bloc/time_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helper.dart';

class TimeView extends StatelessWidget {
  const TimeView({Key? key, required this.timeBloc}) : super(key: key);

  final TimeBloc timeBloc;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      builder: (context, TimeState state){
        return Material(
          color: getBackground(state),
          child: Center(
            child: Text(
              formatTime(state.duration),
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 95, color: (state is TimeRunState) ? Colors.white : Colors.black),
            ),
          ),
        );
      },
      bloc: timeBloc,
      listener: (context, state) {},
    );
  }

  Color getBackground(TimeState state){
    switch(state.runtimeType){
      case TimeRunState:
        return Colors.green;
      case TimeCompleteState:
        return Colors.red;
    }
    return Colors.grey;
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

}
