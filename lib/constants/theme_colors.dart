import 'package:demo_bloc/constants/app_colors.dart';
import 'package:flutter/material.dart';

enum ThemeColors{
  blue('#257cf7'),
  green('#9ada23'),
  purple('#ab05af'),
  gray('#456865'),
  orange('#c86049');

  final String hex;
  Color get color => HexColor.fromHex(hex);
  const ThemeColors(this.hex);
}