import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lifecare/app/modules/auth/domain/entities/login_with_email_and_password_entity.dart';
import 'package:lifecare/app/modules/auth/domain/params/login_with_email_and_password_params.dart';
import 'package:lifecare/app/modules/auth/external/datasources/firebase/auth_datasource_firebase_impl.dart';
import 'package:lifecare/app/modules/auth/external/datasources/firebase/mapper/auth_datasource_firebase_mapper.dart';

void main() {
  late final AuthDatasourceFirebaseMapper mapper;
  late final AuthDatasourceFirebaseImpl datasource;
  late final MockFirebaseAuth firebaseAuthInstance;
  final mockUser = MockUser(email: 'adby.santos15@outlook.com', displayName: 'adbysantos');
  final loginEntity = LoginWithEmailAndPasswordEntity(-1, '', 'adbysantos');

  //final signupEntity = SignupWithEmailAndPasswordEntity(-1, '', 'adbysantos');

  setUpAll(() {
    mapper = AuthDatasourceFirebaseMapper();
    firebaseAuthInstance = MockFirebaseAuth(mockUser: mockUser);
    datasource = AuthDatasourceFirebaseImpl(firebaseAuthInstance, mapper);
  });

  group('AuthDatasourceFirebaseImpl', () {
    test('loginWithEmailAndPassword', () {
      final result = datasource.loginWithEmailAndPassword(LoginWithEmailAndPasswordParams('adby', '1a2d3b4d'));
      expect(result.then((value) => value.username), completion(loginEntity.username));
    });
    // test('signupWithEmailAndPassword', () {
    //   final result = _datasource.signupWithEmailAndPassword(SignupWithEmailAndPasswordParams('adby', '1a2d3b4d'));
    //   expect(result.then((value) => value.username), completion(signupEntity.username));
    // });
  });
}
