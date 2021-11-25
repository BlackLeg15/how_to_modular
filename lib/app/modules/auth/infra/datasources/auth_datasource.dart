import '../../domain/entities/login_with_email_and_password_entity.dart';
import '../../domain/entities/signup_with_email_and_password_entity.dart';
import '../../domain/params/login_with_email_and_password_params.dart';
import '../../domain/params/signup_with_email_and_password_params.dart';

abstract class AuthDatasource {
  Future<LoginWithEmailAndPasswordEntity> loginWithEmailAndPassword(LoginWithEmailAndPasswordParams params);
  Future<SignupWithEmailAndPasswordEntity> signupWithEmailAndPassword(SignupWithEmailAndPasswordParams params);
}
