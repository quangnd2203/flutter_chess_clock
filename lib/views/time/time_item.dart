import 'package:flutter/material.dart';

class TimeItem extends StatelessWidget {
  const TimeItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(
          child: Text(
            '1 min - 1sec',
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Radio(
          value: null,
          groupValue: 10,
          onChanged: (v) {},
          activeColor: Colors.green,
          splashRadius: 0.1,
          fillColor: MaterialStateProperty.resolveWith((states){
            if(states.isEmpty){
              return Colors.white38;
            }
          }),
        )
      ],
    );
  }
}
