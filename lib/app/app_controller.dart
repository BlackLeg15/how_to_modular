import 'package:lifecare_app/app/modules/app_repository.dart';

import 'modules/auth/domain/params/login_with_email_and_password_params.dart';
import 'modules/auth/domain/usecases/login_with_email_and_password/login_with_email_and_password_usecase.dart';

class AppController {
  final LoginWithEmailAndPasswordUsecase loginWithEmailAndPasswordUsecase;
  final AppRepository appRepository;
  String? errorMessage;
  String? username;

  AppController({required this.loginWithEmailAndPasswordUsecase, required this.appRepository});

  Future<void> loginWithEmail() async {
    final loginParams = LoginWithEmailAndPasswordParams('', '');
    final loginResult = await loginWithEmailAndPasswordUsecase(loginParams);
    loginResult.fold((error) {
      errorMessage = error.message;
    }, (loginEntity) {
      username = loginEntity.username;
    });
  }
}
