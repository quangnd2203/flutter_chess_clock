import 'package:bloc/bloc.dart';
import 'package:demo_bloc/constants/app_prefs.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:demo_bloc/models/time_data_model.dart';

class TimeDataCubit extends Cubit<int> {
  TimeDataCubit() : super(0);

  final Box<TimeDataModel> box = Hive.box('time_data');

  selectItem(int hashCode){
    emit(hashCode);
  }

  save(){
    if(state != 0){
      AppPrefs.timeHashCode = state;
      AppPrefs.timeDuration = box.values.firstWhere((e) => e.hashCode == state).duration!;
    }
  }
}
