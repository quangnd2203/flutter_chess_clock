import 'package:demo_bloc/constants/app_prefs.dart';
import 'package:demo_bloc/constants/app_sound.dart';
import 'package:demo_bloc/constants/theme_colors.dart';
import 'package:demo_bloc/views/routers/app_page.dart';
import 'package:demo_bloc/views/widgets/theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'constants/app_colors.dart';
import 'models/time_data_model.dart';

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

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();

  static void changeTheme(BuildContext context, Color primaryColor) {
    _AppState state = context.findAncestorStateOfType<_AppState>()!;
    state.changeTheme(primaryColor);
  }
}

class _AppState extends State<App> {

  ThemeData themeData = ThemeData(
      primaryColor: ThemeColors.values.firstWhere((element) => AppPrefs.hexTheme.contains(element.hex)).color,
      scaffoldBackgroundColor: AppColors.bgBlack,
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(background: AppColors.bgBlack),
    );

  @override
  Widget build(BuildContext context) {
    return ThemeSwitcher(
      themeData: themeData,
      child: const MyApp(),
    );
  }

  changeTheme(Color primaryColor) {
    setState(() {
      themeData = themeData.copyWith(primaryColor: primaryColor);
    });
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
      getPages: AppPages.pages,
      initialRoute: Routes.clockView.route,
      theme: ThemeSwitcher.of(context).themeData,
    );
  }
}
