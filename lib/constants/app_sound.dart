import 'package:demo_bloc/blocs/sound_bloc/sound_cubit.dart';
import 'package:just_audio/just_audio.dart';
import 'package:get/get.dart';

class AppSound {
  AppSound._();
  static AppSound? _instance;

  factory AppSound() {
    return _instance ??= AppSound._();
  }

  final AudioPlayer _player = AudioPlayer();
  late List<AudioSource> _playList;
  SoundValue? _currentValue;

  Future<void> loading() async {
    _playList = SoundValue.values.map((s){
      return AudioSource.asset(s.asset);
    }).toList();
  }

  Future<void> play(SoundValue value) async {
    if(!Get.find<SoundCubit>().state) return;
    if(_currentValue != value){
      _currentValue = value;
      await _player.setAudioSource(_playList[value.index]);
    }
    await _player.seek(Duration.zero);
    await _player.play();
  }
}

enum SoundValue {
  next('assets/audio/next.m4a'),
  click('assets/audio/click.wav'),
  finish('assets/audio/finish.m4a'),
  tic('assets/audio/tic.wav'),
  ring('assets/audio/ring.mp3');

  final String asset;
  const SoundValue(this.asset);
}
