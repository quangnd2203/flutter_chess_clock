import 'package:demo_bloc/views/widgets/keyboard_dimisser.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../widgets/custom_appbar.dart';

class CustomTime extends StatelessWidget {
  const CustomTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KeyboardDismisser(
        child: Column(
          children: [
            const CustomAppbar(
              title: 'Time Controls',
            ),
            Expanded(
              child: buildBody(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          buildName(),
        ],
      ),
    );
  }

  Widget buildName() {
    return TextField(
      style: const TextStyle(fontSize: 16, color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        labelText: 'Name',
        floatingLabelStyle: MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.focused)) {
            return const TextStyle(fontSize: 14, color: Colors.green);
          }
          return const TextStyle(fontSize: 16, color: Colors.grey);
        }),
        labelStyle: const TextStyle(fontSize: 16, color: Colors.grey),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 0),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 2),
        ),
        filled: true,
        fillColor: AppColors.black,
      ),
    );
  }
}
