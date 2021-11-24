import 'package:lifecare/app/modules/auth/domain/entities/login_with_email_and_password_entity.dart';
import 'package:lifecare/app/modules/auth/domain/entities/signup_with_email_and_password_entity.dart';
import 'package:lifecare/app/modules/auth/domain/params/login_with_email_and_password_params.dart';
import 'package:lifecare/app/modules/auth/domain/params/signup_with_email_and_password_params.dart';

abstract class AuthDatasource {
  Future<LoginWithEmailAndPasswordEntity> loginWithEmailAndPassword(LoginWithEmailAndPasswordParams params);
  Future<SignupWithEmailAndPasswordEntity> signupWithEmailAndPassword(SignupWithEmailAndPasswordParams params);
}
