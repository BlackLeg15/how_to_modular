import 'package:lifecare/app/shared/errors/lifecare_exception.dart';

abstract class LoginWithEmailAndPasswordError extends LifecareException {
  LoginWithEmailAndPasswordError(String message) : super(message: message);
}

class NotValidEmail extends LoginWithEmailAndPasswordError {
  NotValidEmail(String message) : super(message);
}
class UserNotFoundLoginError extends LoginWithEmailAndPasswordError {
  UserNotFoundLoginError(String message) : super(message);
}

class WrongPasswordLoginError extends LoginWithEmailAndPasswordError {
  WrongPasswordLoginError(String message) : super(message);
}

class UnknownLoginWithEmailInfraError extends LoginWithEmailAndPasswordError {
  UnknownLoginWithEmailInfraError(String message) : super(message);
}
