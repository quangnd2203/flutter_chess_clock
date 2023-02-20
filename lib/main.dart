import 'package:demo_bloc/constants/app_sound.dart';
import 'package:demo_bloc/views/widgets/theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'constants/app_colors.dart';
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
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeSwitcherWidget(
      initialThemeData: ThemeData(
        scaffoldBackgroundColor: AppColors.bgBlack,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(background: AppColors.bgBlack),
      ),
      child: const MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

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
      // theme: ThemeSwitcher.of(context).themeData,
      home: ClockView(),
    );
  }
}
