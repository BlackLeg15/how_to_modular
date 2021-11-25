import 'package:dartz/dartz.dart';

import '../../domain/errors/login_with_email_and_password_errors.dart';
import '../../domain/errors/signup_with_email_and_password_errors.dart';
import '../../domain/params/login_with_email_and_password_params.dart';
import '../../domain/params/signup_with_email_and_password_params.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/typedefs/login_with_email_and_password_typedef.dart';
import '../../domain/typedefs/signup_with_email_and_password_typedef.dart';
import '../datasources/auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource _datasource;

  AuthRepositoryImpl(this._datasource);

  @override
  LoginWithEmailAndPasswordResult loginWithEmailAndPassword(LoginWithEmailAndPasswordParams params) async {
    try {
      final result = await _datasource.loginWithEmailAndPassword(params);
      return Right(result);
    } on LoginWithEmailAndPasswordError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(UnknownLoginWithEmailInfraError('Unknown Login With E-mail Error: $stacktrace'));
    }
  }

  @override
  SignupWithEmailAndPasswordResult signupWithEmailAndPassword(SignupWithEmailAndPasswordParams params) async {
    try {
      final result = await _datasource.signupWithEmailAndPassword(params);
      return Right(result);
    } on SignupWithEmailAndPasswordError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(UnknownSignupWithEmailInfraError('Unknown Signup With E-mail Error: $stacktrace'));
    }
  }
}
