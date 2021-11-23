import '../../../../domain/entities/login_with_email_and_password_entity.dart';

abstract class LoginWithEmailAndPasswordStoreState {
  const LoginWithEmailAndPasswordStoreState();
}

class LoginWithEmailAndPasswordStoreInitialState extends LoginWithEmailAndPasswordStoreState {}

class LoginWithEmailAndPasswordStoreLoadingState extends LoginWithEmailAndPasswordStoreState {}

class LoginWithEmailAndPasswordStoreLoadedState extends LoginWithEmailAndPasswordStoreState {
  final LoginWithEmailAndPasswordEntity entity;

  LoginWithEmailAndPasswordStoreLoadedState({required this.entity});
}

class LoginWithEmailAndPasswordStoreErrorState extends LoginWithEmailAndPasswordStoreState {
  final String message;

  LoginWithEmailAndPasswordStoreErrorState({required this.message});
}
