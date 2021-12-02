import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lifecare/app/modules/auth/domain/entities/login_with_email_and_password_entity.dart';
import 'package:lifecare/app/modules/auth/domain/errors/login_with_email_and_password_errors.dart';
import 'package:lifecare/app/modules/auth/domain/params/login_with_email_and_password_params.dart';
import 'package:lifecare/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:lifecare/app/modules/auth/domain/repositories/formmatter_repository.dart';
import 'package:lifecare/app/modules/auth/domain/usecases/login_with_email_and_password/login_with_email_and_password_usecase_impl.dart';
import 'package:mocktail/mocktail.dart';

class AuthRepositoryMockImpl extends Mock implements AuthRepository {}
class FormatterRepositoryMockImpl extends Mock implements FormatterRepository {}

class LoginWithEmailAndPasswordParamsFake extends Fake implements LoginWithEmailAndPasswordParams {}

void main() {
  late final LoginWithEmailAndPasswordUsecaseImpl usecaseImpl;
  late final AuthRepository authRepository;
  late final FormatterRepository formatterRepository;

  final loginParams = LoginWithEmailAndPasswordParams('adby@gmail.com', '123456');
  final loginParamsEmptyEmail = LoginWithEmailAndPasswordParams('', '123456');
  final loginEntity = LoginWithEmailAndPasswordEntity(0, 'token', 'adby');

  setUpAll(() {
    authRepository = AuthRepositoryMockImpl();
    formatterRepository = FormatterRepositoryMockImpl();
    usecaseImpl = LoginWithEmailAndPasswordUsecaseImpl(authRepository, formatterRepository);
    registerFallbackValue(loginParams);
    //registerFallbackValue(LoginWithEmailAndPasswordParamsFake());
  });

  group('LoginWithEmailAndPasswordUsecaseImpl', () {
    test('deve realizar o login com sucesso', () {
      when(() => authRepository.loginWithEmailAndPassword(any())).thenAnswer((invocation) async => right(loginEntity));
      when(() => formatterRepository.formatEmail(any())).thenAnswer((invocation) async => right('adby@gmail.com'));
      final result = usecaseImpl(loginParams);
      expect(result.then((either) => either.fold((left) => left, (right) => right)), completion(isA<LoginWithEmailAndPasswordEntity>()));
    });
    test('deve retornar um erro de email vazio', () {
      final result = usecaseImpl(loginParamsEmptyEmail);
      expect(result.then((either) => either.fold((left) => left, (right) => right)), completion(isA<NotValidEmail>()));
    });
  });
}
