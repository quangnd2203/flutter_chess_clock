import 'dart:math';

import 'package:demo_bloc/views/widgets/time_input.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../blocs/chess_clock_bloc/chess_clock_bloc.dart';
import '../../blocs/sound_bloc/sound_cubit.dart';
import '../../blocs/time_bloc/time_bloc.dart';
import '../../blocs/time_data_cubit/time_data_cubit.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_prefs.dart';
import '../../constants/theme_colors.dart';
import '../../helper.dart';
import '../../main.dart';
import '../../models/time_data_model.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/keyboard_dimisser.dart';
import '../widgets/theme_switcher.dart';

part '../clock/clock_view.dart';
part '../clock/time_view.dart';
part '../time_control/time_controls.dart';
part '../time_control/time_item.dart';
part '../app_settings/theme_setting.dart';
part '../app_settings/app_settings.dart';
part '../custom_time/custom_time.dart';

class AppPages {
  AppPages._();

  static final pages = [
    GetPage(
      name: Routes.clockView.route,
      page: () => const ClockView(),
      bindings: [
        BindingsBuilder.put(() => ChessClockBloc()),
        BindingsBuilder.put(() => SoundCubit()),
      ],
    ),
    GetPage(
      name: Routes.appSetting.route,
      page: () => const AppSettings(),
    ),
    GetPage(
      name: Routes.timeControl.route,
      page: () => const TimeControls(),
      binding: BindingsBuilder.put(() => TimeDataCubit()),
    ),
    GetPage(
      name: Routes.customTime.route,
      page: () => const CustomTime(),
      // binding: BindingsBuilder.put(() => TimeDataCubit()),
    ),
  ];
}

enum Routes {
  clockView('/clockView'),
  appSetting('/appSetting'),
  timeControl('/timeControl'),
  customTime('/customTime');

  final String route;
  const Routes(this.route);
}
