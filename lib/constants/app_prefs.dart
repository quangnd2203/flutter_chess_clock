import 'package:hive/hive.dart';

class AppPrefs{
  static final Box<dynamic> _box = Hive.box('prefs');

  static bool get soundState => _box.get('sound') ?? false;

  static set soundState(bool status){
    _box.put('sound', status);
  }
}