import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_app/core/utils/export.dart';
import 'package:news_app/features/auth/data/models/user_models.dart';
import 'package:news_app/features/edit_profile/presentation/view_model/edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  static EditProfileCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController webSiteController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  Future<void> updateUserData({
    String? name,
    String? email,
    String? phone,
    String? bio,
    String? webSite,
    String? username,
    required UserModel model,
  }) async {
    emit(EditProfileLoading());
    UserModel user = UserModel(
      email: email ?? model.email,
      fullName: name ?? model.fullName,
      username: username ?? model.username,
      uId: uID,
      bio: bio ?? model.bio,
      phone: phone ?? model.phone,
      webSite: webSite ?? model.webSite,
      image:
          'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg?w=740&t=st=1675243414~exp=1675244014~hmac=26dbdd80a28eef7158e0aac50a44b301f92e573f5f57417cfb639866bed2de31',
    );
    FirebaseFirestore.instance.collection('users').doc(uID).set(user.toMap()).then((value) {
      emit(EditProfileSuccess());
    }).catchError((error) {
      emit(EditProfileError(error.toString()));
    });
  }
}
