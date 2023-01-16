
import 'package:demo_bloc/blocs/time_bloc/time_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeView extends StatelessWidget {
  const TimeView({Key? key, required this.timeBloc, required this.bgColor, required this.textColor}) : super(key: key);

  final TimeBloc timeBloc;
  final Color bgColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bgColor,
      child: Center(
        child: buildTime(),
      ),
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

  List<Widget> buildButtons(TimeState state) {
    return [
      if (state is TimeStartState || state is TimePauseState) ...[
        buildButton(Icons.play_arrow, () {
          timeBloc.add(RunEvent());
        }),
        const SizedBox(
          height: 8,
        ),
      ],
      if (state is TimeCompleteState) ...[
        buildButton(Icons.restart_alt_outlined, () {
          timeBloc.add(ResetEvent());
        }),
        const SizedBox(
          height: 8,
        ),
      ],
      if (state is TimeRunState) ...[
        buildButton(Icons.pause, () {
          timeBloc.add(PauseEvent());
        }),
        const SizedBox(
          height: 8,
        ),
      ],
    ];
  }

  Widget buildTime() {
    return BlocConsumer(
      builder: (context, state) {
        if (state is TimeRunState) {
          return Text(
            state.duration.toString().replaceRange(9, 14, ''),
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 60, color: textColor),
          );
        }
        if (state is TimeStartState) {
          return Text(
            state.duration.toString().replaceRange(9, 14, ''),
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 60, color: textColor),
          );
        }
        if (state is TimeCompleteState) {
          return Text(
            state.duration.toString().replaceRange(9, 14, ''),
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 60, color: textColor),
          );
        }
        if (state is TimePauseState) {
          return Text(
            state.duration.toString().replaceRange(9, 14, ''),
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 60, color: textColor),
          );
        }
        return const SizedBox();
      },
      listener: (context, state) {},
      bloc: timeBloc,
    );
  }

  String durationToString(Duration duration) {
    return duration.toString().replaceRange(10, 14, '');
  }
}
