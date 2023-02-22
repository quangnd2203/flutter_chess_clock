import 'package:demo_bloc/blocs/theme_cubit/theme_cubit.dart';
import 'package:demo_bloc/constants/app_sound.dart';
import 'package:demo_bloc/views/widgets/theme_switcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'constants/app_colors.dart';
import 'constants/theme_colors.dart';
import 'models/time_data_model.dart';
import 'views/clock/clock_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: <SystemUiOverlay>[]);
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]);
  await AppSound().loading();
  await Hive.initFlutter();
  Hive.registerAdapter(TimeDataModelAdapter());
  await Hive.openBox('prefs');
  await Hive.openBox<TimeDataModel>('time_data');
  runApp(
    ThemeSwitcher(
      builder: (context, state) {
        return MyApp(theme: state);
      },
    ),
  );
}

class MyApp extends StatefulWidget {
  final ThemeColors theme;
  const MyApp({super.key, required this.theme});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Chess Clock',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: widget.theme.color,
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (states.isEmpty) {
              return Colors.white38;
            }
            if (states.contains(MaterialState.selected)) {
              return widget.theme.color;
            }
            return null;
          }),
        ),
        scaffoldBackgroundColor: AppColors.bgBlack,
      ),
      home: ClockView(),
    );
  }
}
