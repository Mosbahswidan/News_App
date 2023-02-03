import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/core/utils/app_router.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  Future<void> signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    emit(LoginLoading());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      uID = value.user!.uid;
      emit(LoginSuccsess(uID));
      GoRouter.of(context).pushReplacement(AppRouter.kBottomNavBar);
    }).catchError((e) {
      emit(LoginError());
    });
  }
}
