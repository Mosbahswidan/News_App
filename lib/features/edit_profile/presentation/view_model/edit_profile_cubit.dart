import 'package:news_app/core/utils/export.dart';
import 'package:news_app/features/edit_profile/presentation/view_model/edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());
}
