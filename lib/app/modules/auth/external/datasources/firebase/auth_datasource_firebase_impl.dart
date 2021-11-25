import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/entities/login_with_email_and_password_entity.dart';
import '../../../domain/entities/signup_with_email_and_password_entity.dart';
import '../../../domain/errors/login_with_email_and_password_errors.dart';
import '../../../domain/errors/signup_with_email_and_password_errors.dart';
import '../../../domain/params/login_with_email_and_password_params.dart';
import '../../../domain/params/signup_with_email_and_password_params.dart';
import '../../../infra/datasources/auth_datasource.dart';
import 'mapper/auth_datasource_firebase_mapper.dart';

class AuthDatasourceFirebaseImpl implements AuthDatasource {
  final FirebaseAuth firebaseAuthInstance;
  final AuthDatasourceFirebaseMapper mapper;

  AuthDatasourceFirebaseImpl(this.firebaseAuthInstance, this.mapper);

  @override
  Future<LoginWithEmailAndPasswordEntity> loginWithEmailAndPassword(LoginWithEmailAndPasswordParams params) async {
    var entity = LoginWithEmailAndPasswordEntity(-1, '', '');
    try {
      UserCredential userCredential = await firebaseAuthInstance.signInWithEmailAndPassword(email: params.email, password: params.password);
      entity = mapper.fromUserCredentialToLoginEntity(userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw (UserNotFoundLoginError('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        throw (WrongPasswordLoginError('Wrong password provided for that user.'));
      } else {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
    return entity;
  }

  @override
  Future<SignupWithEmailAndPasswordEntity> signupWithEmailAndPassword(SignupWithEmailAndPasswordParams params) async {
    var entity = SignupWithEmailAndPasswordEntity(-1, '', '');
    try {
      final userCredential = await firebaseAuthInstance.createUserWithEmailAndPassword(email: params.email, password: params.password);
      entity = mapper.fromUserCredentialToSignupEntity(userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw (NotValidPasswordForSignup('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        throw (NotValidEmailForSignup('The account already exists for that email.'));
      } else {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
    return entity;
  }
}
