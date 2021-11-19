import 'package:lifecare_app/app/modules/auth/domain/params/login_with_email_and_password_params.dart';
import '../typedefs/login_with_email_and_password_typedef.dart';

abstract class AuthRepository {
  LoginWithEmailAndPasswordResult loginWithEmailAndPassword(LoginWithEmailAndPasswordParams params);
}
