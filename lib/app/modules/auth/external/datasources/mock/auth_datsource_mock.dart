import 'package:lifecare/app/modules/auth/domain/entities/signup_with_email_and_password_entity.dart';
import 'package:lifecare/app/modules/auth/domain/params/login_with_email_and_password_params.dart';
import 'package:lifecare/app/modules/auth/domain/entities/login_with_email_and_password_entity.dart';
import 'package:lifecare/app/modules/auth/domain/params/signup_with_email_and_password_params.dart';
import 'package:lifecare/app/modules/auth/infra/datasources/auth_datasource.dart';

class AuthDatasourceMockImpl implements AuthDatasource {
  @override
  Future<LoginWithEmailAndPasswordEntity> loginWithEmailAndPassword(LoginWithEmailAndPasswordParams params) async {
    // await Future.delayed(const Duration(seconds: 1));
    return LoginWithEmailAndPasswordEntity(0, 'token', 'adby santos');
  }

  @override
  Future<SignupWithEmailAndPasswordEntity> signupWithEmailAndPassword(SignupWithEmailAndPasswordParams params) async {
    return SignupWithEmailAndPasswordEntity(0, 'token', 'adby santos');
  }
}
