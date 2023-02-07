import 'package:bloc/bloc.dart';
import 'package:demo_bloc/constants/app_prefs.dart';

import '../../constants/app_sound.dart';

class SoundCubit extends Cubit<bool> {
  SoundCubit() : super(AppPrefs.soundState);

  void changeState(bool enable) async {
    AppPrefs.soundState = enable;
    emit(AppPrefs.soundState);
    AppSound().play(SoundValue.click);
  }
}
