import 'package:demo_bloc/blocs/time_bloc/time_bloc.dart';
import 'package:demo_bloc/views/time_view.dart';
import 'package:flutter/material.dart';

class ClockView extends StatelessWidget {
  ClockView({Key? key}) : super(key: key);

  final TimeBloc timeBloc1 = TimeBloc(const Duration(seconds: 10));
  final TimeBloc timeBloc2 = TimeBloc(const Duration(seconds: 10));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: TimeView(
                bgColor: Colors.orange,
                textColor: Colors.black,
                timeBloc: timeBloc1,
              ),
            ),
            Expanded(
              child: TimeView(
                bgColor: Colors.black,
                textColor: Colors.white,
                timeBloc: timeBloc2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
