import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utils/chach_helper.dart';
import 'package:news_app/features/settings/presentation/view_model/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  static SettingsCubit get(context) => BlocProvider.of(context);

  bool isDark = false;
  void changeMode(bool val) {
    isDark = val;
    CachHelper.saveData(key: 'isDark', value: isDark);
    emit(SettingsChangeMode());
    debugPrint(isDark.toString());
  }
}
