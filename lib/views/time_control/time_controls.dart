import 'package:demo_bloc/blocs/theme_cubit/theme_cubit.dart';
import 'package:demo_bloc/blocs/time_data_cubit/time_data_cubit.dart';
import 'package:demo_bloc/constants/app_colors.dart';
import 'package:demo_bloc/views/custom_time/custom_time.dart';
import 'package:demo_bloc/views/app_settings/app_settings.dart';
import 'package:demo_bloc/views/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../constants/theme_colors.dart';
import '../../models/time_data_model.dart';
import 'time_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeControls extends StatelessWidget {
  TimeControls({Key? key}) : super(key: key);

  final TimeDataCubit timeDataCubit = Get.put(TimeDataCubit());

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
                onPressed: () {},
                color: Colors.white,
                splashRadius: 0.1,
                icon: const Icon(
                  Icons.edit,
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.to(const AppSettings());
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
    return BlocConsumer(
      bloc: Get.find<ThemeCubit>(),
      listener: (context, ThemeColors state) {},
      builder: (context, ThemeColors state) {
        return Container(
          height: 60,
          margin: const EdgeInsets.all(24).copyWith(top: 0),
          decoration: BoxDecoration(
            color: state.color,
            borderRadius: BorderRadius.circular(16),
            boxShadow: <BoxShadow>[
              BoxShadow(
                blurRadius: 0.6,
                spreadRadius: 1,
                offset: const Offset(0, -1),
                color: state.color,
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
      },
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
        Get.to(const CustomTime());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Icon(
              Icons.add,
              color: Colors.green,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
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
      valueListenable: timeDataCubit.box.listenable(),
      builder: (BuildContext context, Box<TimeDataModel> value, Widget? child) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) => TimeItem(model: value.getAt(index)!,),
          itemCount: value.length,
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
        );
      },
    );
  }
}
