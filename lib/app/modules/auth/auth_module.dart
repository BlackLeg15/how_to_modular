import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/login_with_email_and_password/login_with_email_and_password_usecase_impl.dart';
import 'external/datasources/mock/auth_datsource_mock.dart';
import 'infra/repositories/auth_repository_impl.dart';
import 'presenter/auth_controller.dart';
import 'presenter/auth_page.dart';
import 'presenter/stores/login_with_email_and_password/login_with_email_and_password_store.dart';

class AuthModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => AuthController(i())),
        Bind((i) => LoginWithEmailAndPasswordStore(i())),
        Bind((i) => LoginWithEmailAndPasswordUsecaseImpl(i())),
        Bind((i) => AuthRepositoryImpl(i())),
        Bind((i) => AuthDatasourceMockImpl()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const AuthPage())
      ];
}
