import 'package:just_audio/just_audio.dart';

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
    _playList = SoundValue.values.map((s) => AudioSource.asset(s.asset)).toList();
    _currentValue = SoundValue.next;
    await _player.setAudioSource(_playList[0]);
  }

  Future<void> play(SoundValue value) async {
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
  finish('assets/audio/finish.m4a');

  final String asset;
  const SoundValue(this.asset);
}
