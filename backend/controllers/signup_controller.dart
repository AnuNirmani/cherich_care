//File 4: lib/controllers/signup_controller.dart
import '../services/auth_service.dart';
import '../models/user_model.dart';

class SignUpController {
  final AuthService _authService = AuthService();

  Future<void> handleEmailSignUp({
    required String email,
    required String password,
    required String username,
    required Function(UserModel) onSuccess,
    required Function(String) onError,
  }) async {
    try {
      final user = await _authService.signUpWithEmailPassword(
        email: email,
        password: password,
        username: username,
      );
      onSuccess(user);
    } catch (e) {
      onError(e.toString());
    }
  }

  Future<void> handleGoogleSignUp({
    required Function(UserModel) onSuccess,
    required Function(String) onError,
  }) async {
    try {
      final user = await _authService.signInWithGoogle();
      onSuccess(user);
    } catch (e) {
      onError(e.toString());
    }
  }
}
