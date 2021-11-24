import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'stores/login_with_email_and_password/login_with_email_and_password_store.dart';

class AuthController implements Disposable {
  final LoginWithEmailAndPasswordStore loginWithEmailAndPasswordStore;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? errorMessage;
  String? username;

  AuthController(this.loginWithEmailAndPasswordStore);

  Future<void> loginWithEmailAndPassword() async {
    loginWithEmailAndPasswordStore.loginWithEmailAndPassword(emailController.text, passwordController.text);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
