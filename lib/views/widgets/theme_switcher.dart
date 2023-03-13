// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class ThemeSwitcher extends InheritedWidget {
  const ThemeSwitcher({super.key, required this.themeData, required super.child});
  final ThemeData themeData;

  static ThemeSwitcher of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeSwitcher>()!;
  }

  @override
  bool updateShouldNotify(covariant ThemeSwitcher oldWidget) {
    return themeData != oldWidget.themeData;
  }
}

