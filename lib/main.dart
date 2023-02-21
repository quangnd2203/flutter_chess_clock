import 'package:demo_bloc/blocs/theme_cubit/theme_cubit.dart';
import 'package:demo_bloc/constants/app_sound.dart';
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
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeCubit themeCubit = Get.put<ThemeCubit>(ThemeCubit());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: themeCubit,
      listener: (context, ThemeColors state) {
        // TODO: implement listener
      },
      builder: (context, ThemeColors state) {
        return GetMaterialApp(
          title: 'Chess Clock',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: state.color,
            radioTheme: RadioThemeData(
              fillColor: MaterialStateProperty.resolveWith((states) {
                if (states.isEmpty) {
                  return Colors.white38;
                }
                if (states.contains(MaterialState.selected)){
                  return state.color;
                }
                return null;
              }),
            ),
            scaffoldBackgroundColor: AppColors.bgBlack,
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(background: AppColors.bgBlack),
          ),
          home: ClockView(),
        );
      },
      // buildWhen: (ThemeColors previous, ThemeColors current){
      //   return previous != current;
      // },
    );
  }
}
