import 'package:flutter/material.dart';
import 'package:flutter_workout_application/features/auth/sign_in/repository/auth_repository.dart';

class SignInViewModel {
  final _authRepository = AuthRepository();

  Future<void> onSignInPressed({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      await _authRepository.signIn(email, password);
    } catch (e) {
      if (!context.mounted) return;
      _showSnackBar(context, e.toString());
    }
  }

  void _showSnackBar(BuildContext context, String text) {
    final snackBarText = Text(text);
    final snackBar = SnackBar(content: snackBarText);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void onSignUpPressed() {}
}
