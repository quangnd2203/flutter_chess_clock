part of '../routers/app_page.dart';

class CustomTime extends StatefulWidget {
  const CustomTime({Key? key}) : super(key: key);

  @override
  State<CustomTime> createState() => _CustomTimeState();
}

class _CustomTimeState extends State<CustomTime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KeyboardDismisser(
        child: Column(
          children: [
            const CustomAppbar(
              title: 'Time Controls',
            ),
            Expanded(
              child: buildBody(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          buildName(),
        ],
      ),
    );
  }

  Widget buildName() {
    final Color themeColor = ThemeSwitcher.of(context).themeData.primaryColor;
    return TextField(
      style: const TextStyle(fontSize: 16, color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        labelText: 'Name',
        floatingLabelStyle: MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.focused)) {
            return TextStyle(fontSize: 14, color: themeColor);
          }
          return const TextStyle(fontSize: 16, color: Colors.grey);
        }),
        labelStyle: const TextStyle(fontSize: 16, color: Colors.grey),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 0),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: themeColor, width: 2),
        ),
        filled: true,
        fillColor: AppColors.black,
      ),
    );
  }
}
