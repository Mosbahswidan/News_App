import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/core/widgets/custom_snack_bar.dart';
import 'package:news_app/features/auth/data/models/user_models.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  static SignupCubit get(context) => BlocProvider.of(context);
  Future<void> signUp(
      {required String email,
      required String username,
      required String password,
      required BuildContext context}) async {
    emit(SignupLoading());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      createUser(
          email: email,
          password: password,
          username: username,
          uId: value.user!.uid);
         UID = value.user!.uid;
      emit(SignupSuccess());
    }).catchError((e) {
      emit(SignupError("email is already use by another account"));
    });
  }

  Future<void> createUser({
    required String email,
    required String password,
    required String username,
    required String uId,
  }) async {
    UserModel user = UserModel(
        email: email,
        name: username,
        password: password,
        uId: uId,
        image:
            'https://scontent.fgza9-1.fna.fbcdn.net/v/t39.30808-6/274473534_1826232434236112_8259770904627916354_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=54sGVE-3L2MAX-J3S55&_nc_ht=scontent.fgza9-1.fna&oh=00_AT80LYRPrZlkswD6-t2872Pm1yE-Vz-A2GI3x_R2qYGbxQ&oe=62F08743');

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(user.toMap())
        .then((value) {
      emit(CreateUserSucsses());
    }).catchError((error) {
      emit(CreateUserError(error.toString()));
    });
  }
}
