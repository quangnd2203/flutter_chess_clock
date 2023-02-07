import 'package:demo_bloc/blocs/sound_bloc/sound_cubit.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class AppSound {
  AppSound._();
  static AppSound? _instance;

  factory AppSound() {
    return _instance ??= AppSound._();
  }

  final AudioPlayer _player = AudioPlayer();
  final AudioCache _cache = AudioCache();
  SoundValue? _currentValue;

  Future<dynamic> loading() async {
    _player.onDurationChanged.listen((event) {
      if(!Get.find<SoundCubit>().state){
        _player.setVolume(0);
      }else{
        _player.setVolume(1);
      }
    });
    return _cache.loadAll(SoundValue.values.map((e) => e.asset).toList());
  }

  Future<void> play(SoundValue value) async {
    if(!Get.find<SoundCubit>().state) return;
    if(_currentValue != value){
      _currentValue = value;
    }
    await _player.seek(Duration.zero);
    await _player.play(AssetSource(value.asset));
  }
}

enum SoundValue {
  next('audio/next.m4a'),
  click('audio/click.wav'),
  finish('audio/finish.m4a'),
  tic('audio/tic.wav'),
  ring('audio/ring.mp3');

  final String asset;
  const SoundValue(this.asset);
}
