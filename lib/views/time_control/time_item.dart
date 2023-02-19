import 'package:demo_bloc/blocs/time_data_cubit/time_data_cubit.dart';
import 'package:demo_bloc/models/time_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class TimeItem extends StatelessWidget {
  final TimeDataModel model;
  const TimeItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.find<TimeDataCubit>().selectItem(model.hashCode);
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                '${model.getDurationString()}${model.increase != null ? ' || ${model.increase} sec' : ''}',
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            SizedBox(
              width: 20,
              height: 20,
              child: BlocConsumer(
                bloc: Get.find<TimeDataCubit>(),
                builder: (context, int state){
                  return Radio(
                    value: model.hashCode,
                    groupValue: state,
                    onChanged: (v) {},
                    activeColor: Colors.green,
                    splashRadius: 0.1,
                    fillColor: MaterialStateProperty.resolveWith((states){
                      if(states.isEmpty){
                        return Colors.white38;
                      }
                      return null;
                    }),
                  );
                },
                listener: (context, state) {},
                buildWhen: (int previous, int current) {
                  return current == model.hashCode || previous == model.hashCode;
                },
              ),
            )
          ],
        ),
      ),
    );
  }

}
