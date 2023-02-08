import 'package:hive/hive.dart';
part 'time_data_model.g.dart';

@HiveType(typeId: 0)
class TimeDataModel extends HiveObject{

  @HiveField(0)
  int? duration;

  @HiveField(1)
  int? increase;

  TimeDataModel({this.duration, this.increase});

  String getDurationString(){
    if(duration! < 60) {
      return '$duration sec';
    } else {
      int minutes = duration! ~/ 60;
      int seconds = duration! % 60;
      return '$minutes min${(seconds > 0) ? ', $seconds sec' :''}';
    }
  }
}
