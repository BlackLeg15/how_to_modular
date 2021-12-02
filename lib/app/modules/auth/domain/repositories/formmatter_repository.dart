import 'package:dartz/dartz.dart';

import '../errors/login_with_email_and_password_errors.dart';

abstract class FormatterRepository {
  Future<Either<LoginWithEmailAndPasswordError, String>> formatEmail(String email);
}
