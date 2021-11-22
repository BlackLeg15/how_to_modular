import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lifecare_app/app/modules/auth/domain/entities/login_with_email_and_password_entity.dart';
import 'package:lifecare_app/app/modules/auth/domain/params/login_with_email_and_password_params.dart';
import 'package:lifecare_app/app/modules/auth/infra/datasources/auth_datasource.dart';
import 'package:lifecare_app/app/modules/auth/infra/repositories/auth_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class AuthDatasourceMock extends Mock implements AuthDatasource {}

void main() {
  late final AuthDatasource authDatasource;
  late final AuthRepositoryImpl authRepositoryImpl;

  final loginParams = LoginWithEmailAndPasswordParams('adby@gmail.com', '123456');
  final loginEntity = LoginWithEmailAndPasswordEntity(0, 'token', 'adby');

  setUpAll(() {
    authDatasource = AuthDatasourceMock();
    authRepositoryImpl = AuthRepositoryImpl(authDatasource);
    registerFallbackValue(loginParams);
  });

  group('AuthRepositoryImpl.loginWithEmailAndPassword', () {
    test('deve realizar um login bem sucedido', () {
      when(() => authDatasource.loginWithEmailAndPassword(any())).thenAnswer((invocation) async => loginEntity);
      final result = authRepositoryImpl.loginWithEmailAndPassword(loginParams);
      expect(result.then((either) => either.fold(id, id)), completion(isA<LoginWithEmailAndPasswordEntity>()));
    });
  });
}
