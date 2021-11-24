import '../../../../shared/errors/lifecare_exception.dart';

abstract class SignupWithEmailAndPasswordError extends LifecareException {
  SignupWithEmailAndPasswordError(String message) : super(message: message);
}

class NotValidEmailForSignup extends SignupWithEmailAndPasswordError {
  NotValidEmailForSignup(String message) : super(message);
}

class NotValidPasswordForSignup extends SignupWithEmailAndPasswordError {
  NotValidPasswordForSignup(String message) : super(message);
}

class UnknownSignupWithEmailInfraError extends SignupWithEmailAndPasswordError {
  UnknownSignupWithEmailInfraError(String message) : super(message);
}
