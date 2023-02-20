import 'package:bloc/bloc.dart';
import 'package:demo_bloc/blocs/time_data_cubit/time_data_cubit.dart';
import 'package:demo_bloc/constants/theme_colors.dart';
import 'package:demo_bloc/constants/app_prefs.dart';
import 'package:get/get.dart';

class ThemeCubit extends Cubit<ThemeColors> {
  ThemeCubit() : super(ThemeColors.values.firstWhere((e) => e.hex == AppPrefs.hexTheme));

  selectItem(ThemeColors color) {
    emit(color);
  }

  @override
  void onChange(Change<ThemeColors> change) {
    // TODO: implement onChange
    super.onChange(change);
    if (change.currentState != change.nextState) {
      AppPrefs.hexTheme = state.hex;
    }
  }
}
