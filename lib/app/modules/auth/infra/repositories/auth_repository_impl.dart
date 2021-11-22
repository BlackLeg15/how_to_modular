import 'package:dartz/dartz.dart';
import 'package:lifecare_app/app/modules/auth/domain/errors/login_with_email_and_password_errors.dart';
import 'package:lifecare_app/app/modules/auth/domain/params/login_with_email_and_password_params.dart';
import 'package:lifecare_app/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:lifecare_app/app/modules/auth/domain/typedefs/login_with_email_and_password_typedef.dart';
import 'package:lifecare_app/app/modules/auth/infra/datasources/auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource _datasource;

  AuthRepositoryImpl(this._datasource);

  @override
  LoginWithEmailAndPasswordResult loginWithEmailAndPassword(LoginWithEmailAndPasswordParams params) async {
    try {
      final result = await _datasource.loginWithEmailAndPassword(params);
      return Right(result);
    } catch (e, stacktrace) {
      return Left(UnknownLoginWithEmailInfraError('Unknown Login With E-mail Error: $stacktrace'));
    }
  }
}
