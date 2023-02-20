import 'package:demo_bloc/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/theme_switcher.dart';
import 'theme_setting.dart';
import 'package:get/get.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgBlack,
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
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          const ThemeSetting(),
          const SizedBox(height: 30,),
          Text(ThemeSwitcher.of(Get.context!).name ?? ''),
          // Container(width: 100, height: 100, color: Theme.of(Get.context!).primaryColor,)
        ],
      ),
    );
  }
}