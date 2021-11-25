import '../../../domain/entities/login_with_email_and_password_entity.dart';
import '../../../domain/entities/signup_with_email_and_password_entity.dart';
import '../../../domain/params/login_with_email_and_password_params.dart';
import '../../../domain/params/signup_with_email_and_password_params.dart';
import '../../../infra/datasources/auth_datasource.dart';

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
