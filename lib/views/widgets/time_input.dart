import 'package:demo_bloc/views/widgets/theme_switcher.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class TimeInput extends StatelessWidget {
  const TimeInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        buildInput(context),
        const SizedBox(width: 8,),
        const Text(':', style: TextStyle(fontSize: 16, color: Colors.white),),
        const SizedBox(width: 8,),
        buildInput(context),
      ],
    );
  }

  Widget buildInput(BuildContext context){
    return SizedBox(
      width: 30,
      child: Center(
        child: TextField(
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white
          ),
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.center,
          maxLength: 2,
          maxLines: 1,
          decoration: InputDecoration(
            hintText: '00',
            counterText: '',
            focusColor: ThemeSwitcher.of(context).themeData.primaryColor,
            hintStyle: const TextStyle(
                fontSize: 16,
                color: Colors.white
            ),
            filled: true,
            fillColor: AppColors.black,
            isCollapsed: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 2)
          ),
        ),
      ),
    );
  }
}
