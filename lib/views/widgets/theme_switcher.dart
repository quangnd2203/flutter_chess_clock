import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../blocs/theme_cubit/theme_cubit.dart';
import '../../constants/theme_colors.dart';

class ThemeSwitcher extends StatefulWidget {
  final Widget Function(BuildContext context, ThemeColors state) builder;

  const ThemeSwitcher({Key? key, required this.builder}) : super(key: key);

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  final ThemeCubit themeCubit = Get.put<ThemeCubit>(ThemeCubit());

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: themeCubit,
      listener: (context, state){},
      builder: widget.builder,
    );
  }
}
