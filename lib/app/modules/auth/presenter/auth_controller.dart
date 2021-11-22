import 'package:flutter/cupertino.dart';
import 'package:lifecare_app/app/modules/auth/domain/params/login_with_email_and_password_params.dart';
import 'package:lifecare_app/app/modules/auth/presenter/stores/login_with_email_and_password_store.dart';

class AuthController {
  final LoginWithEmailAndPasswordStore loginWithEmailAndPasswordStore;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? errorMessage;
  String? username;

  AuthController(this.loginWithEmailAndPasswordStore);

  Future<void> loginWithEmailAndPassword() async {
    final result = await loginWithEmailAndPasswordStore.usecase(LoginWithEmailAndPasswordParams(emailController.text, passwordController.text));
    result.fold(
      (error) {
        errorMessage = error.message;
      },
      (loginEntity) {
        username = loginEntity.username;
      },
    );
  }
}
