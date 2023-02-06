import 'package:bloc/bloc.dart';
import 'package:demo_bloc/constants/app_prefs.dart';

class SoundCubit extends Cubit<bool> {
  SoundCubit() : super(AppPrefs.soundState);

  void changeState(bool enable){
    AppPrefs.soundState = enable;
    emit(AppPrefs.soundState);
  }
}
