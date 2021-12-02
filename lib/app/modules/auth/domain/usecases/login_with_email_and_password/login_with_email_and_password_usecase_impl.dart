import 'package:dartz/dartz.dart';

import '../../errors/login_with_email_and_password_errors.dart';
import '../../params/login_with_email_and_password_params.dart';
import '../../repositories/auth_repository.dart';
import '../../repositories/formmatter_repository.dart';
import '../../typedefs/login_with_email_and_password_typedef.dart';
import 'login_with_email_and_password_usecase.dart';

class LoginWithEmailAndPasswordUsecaseImpl implements LoginWithEmailAndPasswordUsecase {
  final AuthRepository _authRepository;
  final FormatterRepository _formatterRepository;

  LoginWithEmailAndPasswordUsecaseImpl(this._authRepository, this._formatterRepository);

  @override
  LoginWithEmailAndPasswordResult call(LoginWithEmailAndPasswordParams params) async {
    if (params.email.isEmpty) {
      return Left(NotValidEmail('e-mail_is_empty'));
    }
    
    String email = params.email;
    final resultFromFormat = await _formatterRepository.formatEmail(params.email);
    resultFromFormat.fold((l) {
      return left(UnknownLoginWithEmailInfraError('Erro no Formatter'));
    }, (formattedEmail) {
      email = formattedEmail;
    });

    return _authRepository.loginWithEmailAndPassword(LoginWithEmailAndPasswordParams(email, params.password));
  }
}
