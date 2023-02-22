import 'package:demo_bloc/blocs/theme_cubit/theme_cubit.dart';
import 'package:demo_bloc/constants/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeSetting extends StatelessWidget {
  final ThemeColors theme;
  const ThemeSetting({Key? key, required this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const Text(
          'Theme color',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(
          height: 24,
        ),
        buildThemes(),
      ],
    );
  }

  Widget buildThemes() {
    return GridView.count(
      crossAxisCount: 5,
      shrinkWrap: true,
      crossAxisSpacing: 32,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      children: List.generate(ThemeColors.values.length, (index) => buildThemeItem(ThemeColors.values[index])),
    );
  }

  Widget buildThemeItem(ThemeColors color) {
    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: () => Get.find<ThemeCubit>().selectItem(color),
      child: CircleAvatar(
        backgroundColor: color.color,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (theme == color)
              const Icon(
                Icons.check,
                color: Colors.black,
              )
            else
              const SizedBox(),
          ],
        ),
      ),
    );
  }
}
