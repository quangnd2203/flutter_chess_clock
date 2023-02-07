import 'package:demo_bloc/constants/app_colors.dart';
import 'package:demo_bloc/views/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import 'time_item.dart';

class TimeControls extends StatelessWidget {
  const TimeControls({Key? key}) : super(key: key);

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
                onPressed: () {},
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
        ],
      ),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          buildButtonAdd(),
          const SizedBox(height: 8,),
          buildList(),
        ],
      ),
    );
  }

  Widget buildButtonAdd() {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {},
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
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => const TimeItem(),
      itemCount: 20,
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
    );
  }
}