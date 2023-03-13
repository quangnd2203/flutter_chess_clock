part of '../routers/app_page.dart';

class TimeControls extends StatefulWidget {
  const TimeControls({Key? key}) : super(key: key);

  @override
  State<TimeControls> createState() => _TimeControlsState();
}

class _TimeControlsState extends State<TimeControls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgBlack,
      body: Column(
        children: <Widget>[
          CustomAppbar(
            title: 'Time Controls',
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  Get.toNamed(Routes.customTime.route);
                },
                color: Colors.white,
                splashRadius: 0.1,
                icon: const Icon(
                  Icons.edit,
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.toNamed(Routes.appSetting.route);

                  // Navigator.push(Get.context!, MaterialPageRoute(builder: (BuildContext context) => const AppSettings()));
                },
                color: Colors.white,
                splashRadius: 0.1,
                icon: const Icon(
                  Icons.settings,
                ),
              ),
            ],
          ),
          Expanded(
            child: buildBody(),
          ),
          buildButtonStart(),
        ],
      ),
    );
  }

  Widget buildButtonStart() {
    return Container(
      height: 60,
      margin: const EdgeInsets.all(24).copyWith(top: 0),
      decoration: BoxDecoration(
        color: ThemeSwitcher.of(context).themeData.primaryColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 0.6,
            spreadRadius: 1,
            offset: const Offset(0, -1),
            color: ThemeSwitcher.of(context).themeData.primaryColor,
          ),
        ],
      ),
      child: const Center(
        child: Text(
          'Start',
          style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 16, bottom: 90),
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: <Widget>[
          buildButtonAdd(),
          const SizedBox(
            height: 8,
          ),
          buildList(),
        ],
      ),
    );
  }

  Widget buildButtonAdd() {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
        // Get.to(const CustomTime());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.add,
              color: ThemeSwitcher.of(context).themeData.primaryColor,
            ),
            const SizedBox(
              width: 4,
            ),
            const Text(
              'New Custom Time',
              style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildList() {
    return ValueListenableBuilder<Box<TimeDataModel>>(
      valueListenable: Get.find<TimeDataCubit>().box.listenable(),
      builder: (BuildContext context, Box<TimeDataModel> value, Widget? child) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) => TimeItem(
            model: value.getAt(index)!,
          ),
          itemCount: value.length,
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
        );
      },
    );
  }
}
