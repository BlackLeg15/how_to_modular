import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../stores/signup_with_email_and_password/signup_with_email_and_password_store.dart';

class SignupController implements Disposable {
  final SignupWithEmailAndPasswordStore signupWithEmailAndPasswordStore;

  SignupController(this.signupWithEmailAndPasswordStore);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signupWithEmailAndPassword() async {
    signupWithEmailAndPasswordStore.signupWithEmailAndPassword(emailController.text, passwordController.text);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
