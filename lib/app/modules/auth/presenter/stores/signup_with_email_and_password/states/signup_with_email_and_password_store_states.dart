import '../../../../domain/entities/signup_with_email_and_password_entity.dart';

abstract class SignupWithEmailAndPasswordStoreState {
  const SignupWithEmailAndPasswordStoreState();
}

class SignupWithEmailAndPasswordStoreInitialState extends SignupWithEmailAndPasswordStoreState {}

class SignupWithEmailAndPasswordStoreLoadingState extends SignupWithEmailAndPasswordStoreState {}

class SignupWithEmailAndPasswordStoreLoadedState extends SignupWithEmailAndPasswordStoreState {
  final SignupWithEmailAndPasswordEntity entity;

  SignupWithEmailAndPasswordStoreLoadedState({required this.entity});
}

class SignupWithEmailAndPasswordStoreErrorState extends SignupWithEmailAndPasswordStoreState {
  final String message;

  SignupWithEmailAndPasswordStoreErrorState({required this.message});
}
