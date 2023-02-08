import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:demo_bloc/models/time_data_model.dart';

class TimeDataCubit extends Cubit<int> {
  TimeDataCubit() : super(0);

  final Box<TimeDataModel> box = Hive.box('time_data');
}
