import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/settings/presentation/view_model/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());
}
