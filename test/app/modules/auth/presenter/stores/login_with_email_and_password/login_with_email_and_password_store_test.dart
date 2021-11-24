import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lifecare/app/modules/auth/domain/entities/login_with_email_and_password_entity.dart';
import 'package:lifecare/app/modules/auth/domain/params/login_with_email_and_password_params.dart';
import 'package:lifecare/app/modules/auth/domain/usecases/login_with_email_and_password/login_with_email_and_password_usecase.dart';
import 'package:lifecare/app/modules/auth/presenter/stores/login_with_email_and_password/login_with_email_and_password_store.dart';
import 'package:mocktail/mocktail.dart';

class LoginWithEmailAndPasswordUsecaseMock extends Mock implements LoginWithEmailAndPasswordUsecase {}

void main() {
  late final LoginWithEmailAndPasswordUsecase loginWithEmailAndPasswordUsecase;
  late final LoginWithEmailAndPasswordStore loginWithEmailAndPasswordStore;
  late final LoginWithEmailAndPasswordEntity loginWithEmailAndPasswordEntity;
  late final LoginWithEmailAndPasswordParams loginWithEmailAndPasswordParams;

  setUpAll(() {
    loginWithEmailAndPasswordEntity = LoginWithEmailAndPasswordEntity(0, 'token', 'adby');
    loginWithEmailAndPasswordUsecase = LoginWithEmailAndPasswordUsecaseMock();
    loginWithEmailAndPasswordStore = LoginWithEmailAndPasswordStore(loginWithEmailAndPasswordUsecase);
    loginWithEmailAndPasswordParams = LoginWithEmailAndPasswordParams('adby@gmail', '123456');
    registerFallbackValue(loginWithEmailAndPasswordParams);
  });

  group('loginWithEmailAndPasswordUsecase', () {
    test('deve realizar um login bem sucedido', () {
      when(() => loginWithEmailAndPasswordUsecase.call(any())).thenAnswer((invocation) async => right(loginWithEmailAndPasswordEntity));
      final result = loginWithEmailAndPasswordStore.usecase(loginWithEmailAndPasswordParams);
      expect(result.then((either) => either.fold(id, id)), completion(isA<LoginWithEmailAndPasswordEntity>()));
    });
  });
}
