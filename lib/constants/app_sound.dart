import 'package:just_audio/just_audio.dart';

class AppSound{
  AppSound._();
  static AppSound? _instance;

  factory AppSound(){
    return _instance ??= AppSound._();
  }

  Future<void> loading() async {
    await clickAudio.setAsset('assets/audio/click.wav');
    await tapAudio.setAsset('assets/audio/tap.wav');
  }

  AudioPlayer clickAudio = AudioPlayer();
  AudioPlayer tapAudio = AudioPlayer();
}