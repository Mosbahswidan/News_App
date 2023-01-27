import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:news_app/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<void> signIn({required String email, required String password}) async {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print("true");
    }).catchError((e) {
      print("error");
    });
  }
}
