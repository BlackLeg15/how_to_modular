abstract class LifecareException {
  String message;
  LifecareException({
    required this.message,
  });
  @override
  String toString() {
    return message;
  }
}

abstract class LoginWithEmailAndPasswordError extends LifecareException {
  LoginWithEmailAndPasswordError(String message) : super(message: message);
}

class NotValidEmail extends LoginWithEmailAndPasswordError {
  NotValidEmail(String message) : super(message);
}

class UnknownLoginWithEmailInfraError extends LoginWithEmailAndPasswordError {
  UnknownLoginWithEmailInfraError(String message) : super(message);
}
