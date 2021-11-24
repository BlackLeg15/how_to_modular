import 'package:firebase_auth/firebase_auth.dart';
import 'package:lifecare/app/modules/auth/domain/errors/signup_with_email_and_password_errors.dart';
import 'package:lifecare/app/modules/auth/domain/params/signup_with_email_and_password_params.dart';
import 'package:lifecare/app/modules/auth/domain/params/login_with_email_and_password_params.dart';
import 'package:lifecare/app/modules/auth/domain/entities/signup_with_email_and_password_entity.dart';
import 'package:lifecare/app/modules/auth/domain/entities/login_with_email_and_password_entity.dart';
import 'package:lifecare/app/modules/auth/infra/datasources/auth_datasource.dart';

class AuthDatasourceFirebaseImpl implements AuthDatasource {
  final FirebaseAuth firebaseAuthInstance;

  AuthDatasourceFirebaseImpl(this.firebaseAuthInstance);

  @override
  Future<LoginWithEmailAndPasswordEntity> loginWithEmailAndPassword(LoginWithEmailAndPasswordParams params) {
    throw UnimplementedError();
  }

  @override
  Future<SignupWithEmailAndPasswordEntity> signupWithEmailAndPassword(SignupWithEmailAndPasswordParams params) async {
    var entity = SignupWithEmailAndPasswordEntity(-1, '', '');
    try {
      UserCredential userCredential = await firebaseAuthInstance.createUserWithEmailAndPassword(email: params.email, password: params.password);
      entity = SignupWithEmailAndPasswordEntity(int.tryParse(userCredential.user?.uid ?? '-1') ?? -1, userCredential.credential?.token.toString() ?? '', userCredential.user?.displayName ?? '');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw (NotValidPasswordForSignup('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        throw (NotValidEmailForSignup('The account already exists for that email.'));
      }
    } catch (e) {
      rethrow;
    }
    return entity;
  }
}
