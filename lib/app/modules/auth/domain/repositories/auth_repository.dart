import '../params/login_with_email_and_password_params.dart';
import '../params/signup_with_email_and_password_params.dart';
import '../typedefs/login_with_email_and_password_typedef.dart';
import '../typedefs/signup_with_email_and_password_typedef.dart';

abstract class AuthRepository {
  LoginWithEmailAndPasswordResult loginWithEmailAndPassword(LoginWithEmailAndPasswordParams params);
  SignupWithEmailAndPasswordResult signupWithEmailAndPassword(SignupWithEmailAndPasswordParams params);
}
