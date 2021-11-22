
import '../../params/login_with_email_and_password_params.dart';
import '../../typedefs/login_with_email_and_password_typedef.dart';

abstract class LoginWithEmailAndPasswordUsecase {
  LoginWithEmailAndPasswordResult call(LoginWithEmailAndPasswordParams params);
}
