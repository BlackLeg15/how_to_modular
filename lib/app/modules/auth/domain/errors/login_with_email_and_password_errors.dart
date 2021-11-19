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

abstract class LoginWithEmailAndPasswordDomainError extends LifecareException {
  LoginWithEmailAndPasswordDomainError(String message) : super(message: message);
}

class NotValidEmail extends LoginWithEmailAndPasswordDomainError {
  NotValidEmail(String message) : super(message);
}
