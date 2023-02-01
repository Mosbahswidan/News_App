import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/core/utils/firestore_services.dart';
import 'package:news_app/features/auth/data/models/user_models.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  static SignupCubit get(context) => BlocProvider.of(context);

  FirestoreServices services = FirestoreServices.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  Future<void> signUp({
    required String email,
    required String username,
    required String password,
    required String phone,
    required BuildContext context,
    required String fullName,
  }) async {
    emit(SignupLoading());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      createUser(
        email: email,
        phone: phone,
        username: username,
        uId: value.user!.uid,
        fullName: fullName,
      );
      uID = value.user!.uid;
      emit(SignupSuccess());
    }).catchError((e) {
      emit(SignupError("email is already use by another account"));
    });
  }

  Future<void> createUser({
    required String email,
    required String phone,
    required String username,
    required String fullName,
    required String uId,
  }) async {
    UserModel user = UserModel(
      email: email,
      fullName: fullName,
      username: username,
      uId: uId,
      bio: 'This is bio for user',
      phone: phone,
      webSite: 'https://yourwebsite.com',
      image:
          'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg?w=740&t=st=1675243414~exp=1675244014~hmac=26dbdd80a28eef7158e0aac50a44b301f92e573f5f57417cfb639866bed2de31',
    );

    services.setData(path: 'users/$uId/', data: user.toMap()).then((value) {
      emit(CreateUserSucsses());
    }).catchError((error) {
      emit(CreateUserError(error.toString()));
    });
  }
}
