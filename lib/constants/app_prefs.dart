import 'package:hive/hive.dart';

class AppPrefs{
  static final Box<dynamic> _box = Hive.box('prefs');

  static bool get soundState => _box.get('sound') ?? false;

  static set soundState(bool status){
    _box.put('sound', status);
  }

  static int get timeHashCode => _box.get('timeHashCode') ?? 0;

  static set timeHashCode(int hashCode){
    _box.put('timeHashCode', hashCode);
  }

  static int get timeDuration => _box.get('timeDuration') ?? 0;

  static set timeDuration(int timeDuration){
    _box.put('timeDuration', timeDuration);
  }
}