part of '../routers/app_page.dart';

class ThemeSetting extends StatelessWidget {
  const ThemeSetting({Key? key}) : super(key: key);

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
        buildThemes(context),
      ],
    );
  }

  Widget buildThemes(BuildContext context) {
    return GridView.count(
      crossAxisCount: 5,
      shrinkWrap: true,
      crossAxisSpacing: 32,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        ThemeColors.values.length,
        (index) => buildThemeItem(
          ThemeColors.values[index],
          context,
        ),
      ),
    );
  }

  Widget buildThemeItem(ThemeColors color, BuildContext context) {
    Color currentColor = ThemeSwitcher.of(context).themeData.primaryColor;
    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: () {
        AppPrefs.hexTheme = color.hex;
        App.changeTheme(Get.context!, color.color);
      },
      child: CircleAvatar(
        backgroundColor: color.color,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (currentColor.toHex().toLowerCase() == color.hex.toLowerCase())
              const Icon(
                Icons.check,
                color: Colors.black,
              ),
          ],
        ),
      ),
    );
  }
}
