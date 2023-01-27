abstract class AuthRepo {
  Future<void> signIn({required String email, required String password});
}
