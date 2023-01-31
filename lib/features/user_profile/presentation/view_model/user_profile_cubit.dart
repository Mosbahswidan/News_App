import 'package:news_app/core/utils/export.dart';
import 'package:news_app/features/user_profile/presentation/view_model/user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit() : super(UserProfileInitial());
}
