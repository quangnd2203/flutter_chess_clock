import 'package:demo_bloc/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  const CustomAppbar({Key? key, required this.title, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: AppColors.black,
      elevation: 6,
      child: Container(
        color: AppColors.black,
        padding: const EdgeInsets.only(bottom: 4),
        width: Get.width,
        child: SafeArea(
          bottom: false,
          child: Row(
            children: <Widget>[
                  IconButton(
                    onPressed: Get.back,
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                    splashRadius: 0.1,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ] +
                (actions ?? []),
          ),
        ),
      ),
    );
  }
}
