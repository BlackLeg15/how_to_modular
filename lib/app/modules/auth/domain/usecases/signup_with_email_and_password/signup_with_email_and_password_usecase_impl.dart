import 'package:dartz/dartz.dart';
import 'package:lifecare/app/modules/auth/domain/errors/signup_with_email_and_password_errors.dart';
import 'package:lifecare/app/modules/auth/domain/params/signup_with_email_and_password_params.dart';

import '../../repositories/auth_repository.dart';
import '../../typedefs/signup_with_email_and_password_typedef.dart';
import 'signup_with_email_and_password_usecase.dart';

class SignupWithEmailAndPasswordUsecaseImpl implements SignupWithEmailAndPasswordUsecase {
  final AuthRepository _authRepository;

  SignupWithEmailAndPasswordUsecaseImpl(this._authRepository);

  @override
  SignupWithEmailAndPasswordResult call(SignupWithEmailAndPasswordParams params) async {
    if (params.email.isEmpty) {
      return Left(NotValidEmailForSignup('e-mail_is_empty'));
    }
    return _authRepository.signupWithEmailAndPassword(params);
  }
}
