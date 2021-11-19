import 'package:lifecare_app/app/modules/auth/domain/repositories/auth_repository.dart';

import '../../params/login_with_email_and_password_params.dart';
import '../../typedefs/login_with_email_and_password_typedef.dart';

abstract class LoginWithEmailAndPasswordUsecase {
  LoginWithEmailAndPasswordResult call(LoginWithEmailAndPasswordParams params);
}
