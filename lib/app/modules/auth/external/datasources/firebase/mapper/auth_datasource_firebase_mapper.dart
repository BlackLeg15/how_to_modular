import 'package:firebase_auth/firebase_auth.dart';

import '../../../../domain/entities/login_with_email_and_password_entity.dart';
import '../../../../domain/entities/signup_with_email_and_password_entity.dart';

class AuthDatasourceFirebaseMapper {
  LoginWithEmailAndPasswordEntity fromUserCredentialToLoginEntity(UserCredential userCredential) {
    final user = userCredential.user;
    if (user == null) {
      _returnDefaultLoginEntity();
    }
    final id = user!.uid;
    final token = user.refreshToken;
    final displayName = user.displayName;
    return LoginWithEmailAndPasswordEntity(int.tryParse(id) ?? -1, token ?? '', displayName ?? '');
  }

  LoginWithEmailAndPasswordEntity _returnDefaultLoginEntity() {
    return LoginWithEmailAndPasswordEntity(-1, '', '');
  }

  SignupWithEmailAndPasswordEntity fromUserCredentialToSignupEntity(UserCredential userCredential) {
    final user = userCredential.user;
    if (user == null) {
      _returnDefaultSignupEntity();
    }
    final id = user!.uid;
    final token = user.refreshToken;
    final displayName = user.displayName;
    return SignupWithEmailAndPasswordEntity(int.tryParse(id) ?? -1, token ?? '', displayName ?? '');
  }

  SignupWithEmailAndPasswordEntity _returnDefaultSignupEntity() {
    return SignupWithEmailAndPasswordEntity(-1, '', '');
  }
}
