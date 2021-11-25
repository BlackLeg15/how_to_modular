import '../../params/signup_with_email_and_password_params.dart';
import '../../typedefs/signup_with_email_and_password_typedef.dart';

abstract class SignupWithEmailAndPasswordUsecase {
  SignupWithEmailAndPasswordResult call(SignupWithEmailAndPasswordParams params);
}
