abstract class AuthRepository {
  Future<void> signUp(String name, String email, String password);
  Future<void> signInWithGoogle();
}
