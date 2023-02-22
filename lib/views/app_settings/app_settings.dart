import 'package:demo_bloc/blocs/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_appbar.dart';
import 'theme_setting.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppbar(
            title: 'App Settings',
          ),
          Expanded(
            child: buildBody(),
          ),
        ],
      ),
    );
  }

  Widget buildBody() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          ThemeSetting(theme: Get.find<ThemeCubit>().state,),
          const SizedBox(height: 30,),
        ],
      ),
    );
  }
}
