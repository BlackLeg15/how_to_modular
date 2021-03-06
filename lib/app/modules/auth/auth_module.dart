import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/login_with_email_and_password/login_with_email_and_password_usecase_impl.dart';
import 'domain/usecases/signup_with_email_and_password/signup_with_email_and_password_usecase_impl.dart';
import 'external/datasources/firebase/auth_datasource_firebase_impl.dart';
import 'external/datasources/firebase/mapper/auth_datasource_firebase_mapper.dart';
import 'external/services/formatter/formatter_service_impl.dart';
import 'infra/datasources/auth_datasource.dart';
import 'infra/repositories/auth_repository_impl.dart';
import 'infra/repositories/formatter_repository_impl.dart';
import 'presenter/auth_controller.dart';
import 'presenter/auth_page.dart';
import 'presenter/pages/signup_controller.dart';
import 'presenter/pages/signup_page.dart';
import 'presenter/stores/login_with_email_and_password/login_with_email_and_password_store.dart';
import 'presenter/stores/signup_with_email_and_password/signup_with_email_and_password_store.dart';

class AuthModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        //Controllers
        Bind((i) => AuthController(i())),
        Bind((i) => SignupController(i())),
        //Stores
        Bind((i) => SignupWithEmailAndPasswordStore(i())),
        Bind((i) => LoginWithEmailAndPasswordStore(i())),
        //Usecases
        Bind((i) => SignupWithEmailAndPasswordUsecaseImpl(i())),
        Bind((i) => LoginWithEmailAndPasswordUsecaseImpl(i(), i())),
        //Repositories
        Bind((i) => AuthRepositoryImpl(i())),
        Bind((i) => FormatterRepositoryImpl(i())),
        //Datasources
        //Bind((i) => AuthDatasourceMockImpl()),
        Bind<AuthDatasource>((i) => AuthDatasourceFirebaseImpl(i(), i())),
        //Services
        Bind((i) => FormatterServiceImpl()),
        //FirebaseAuth
        Bind((i) => FirebaseAuth.instance),
        //FirebaseAuthMapper
        Bind((i) => AuthDatasourceFirebaseMapper()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const AuthPage()),
        ChildRoute('/signup', child: (_, args) => const SignupPage())
      ];
}
