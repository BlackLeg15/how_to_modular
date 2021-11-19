import 'package:dartz/dartz.dart';

import '../../errors/login_with_email_and_password_errors.dart';
import '../../params/login_with_email_and_password_params.dart';
import '../../repositories/auth_repository.dart';
import '../../typedefs/login_with_email_and_password_typedef.dart';
import 'login_with_email_and_password_usecase.dart';

class LoginWithEmailAndPasswordUsecaseImpl implements LoginWithEmailAndPasswordUsecase {
  final AuthRepository _authRepository;

  LoginWithEmailAndPasswordUsecaseImpl(this._authRepository);

  @override
  LoginWithEmailAndPasswordResult call(LoginWithEmailAndPasswordParams params) async {
    if (params.email.isEmpty) {
      return Left(NotValidEmail('e-mail_is_empty'));
    }
    return _authRepository.loginWithEmailAndPassword(params);
  }
}
