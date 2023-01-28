import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/widgets/custom_snack_bar.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());
  static ResetPasswordCubit get(context) => BlocProvider.of(context);

  Future<void> resetPassword(
      {required String email, required BuildContext context}) async {
    try {
      emit(ResetPasswordLoading());

      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email)
          .then((value) {
        customSnackBar(context, "Verification email has been sent");
        emit(ResetPasswordSuccess());
      }).catchError((error) {
        emit(ResetPasswordError());
      });
    } catch (e) {
      print(e);
    }
  }
}
