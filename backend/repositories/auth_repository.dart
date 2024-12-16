// // lib/repositories/auth_repository.dart
// import '../services/auth_service.dart';
// import '../services/user_service.dart';
// import '../models/user_model.dart';

// class AuthRepository {
//   final AuthService _authService = AuthService();
//   final UserService _userService = UserService();

//   Future<UserModel?> signUp(String email, String password, String username) async {
//     try {
//       final credential = await _authService.signUpWithEmail(email, password, username);
//       if (credential?.user != null) {
//         final user = UserModel(
//           uid: credential!.user!.uid,
//           username: username,
//           email: email,
//           createdAt: DateTime.now(),
//           lastLogin: DateTime.now(),
//         );
//         await _userService.createUser(user);
//         return user;
//       }
//       return null;
//     } catch (e) {
//       print('Error in signUp: $e');
//       rethrow;
//     }