import 'package:bloc/bloc.dart';
import 'package:demo_bloc/constants/theme_colors.dart';
import 'package:demo_bloc/constants/app_prefs.dart';
import 'package:demo_bloc/views/widgets/theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeCubit extends Cubit<ThemeColors> {
  ThemeCubit() : super(ThemeColors.values.firstWhere((e) => e.hex == AppPrefs.hexTheme));

  selectItem(ThemeColors color) {
    emit(color);
  }

  @override
  void onChange(Change<ThemeColors> change) {
    // TODO: implement onChange
    super.onChange(change);
    if (change.currentState != change.nextState) {
      AppPrefs.hexTheme = change.nextState.hex;
      ThemeSwitcher.of(Get.context!).switchMode(
        themeData: ThemeData(
          primaryColor: change.nextState.color,
          iconTheme: IconThemeData(
            color: change.nextState.color,
          ),
          radioTheme: RadioThemeData(
            fillColor: MaterialStateProperty.resolveWith((states) {
              if (states.isEmpty) {
                return Colors.white38;
              }
              if (states.contains(MaterialState.selected)){
                return change.nextState.color;
              }
              return null;
            }),
          ),
        ),
      );
    }
  }
}
