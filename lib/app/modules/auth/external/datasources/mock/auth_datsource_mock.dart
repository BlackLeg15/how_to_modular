import 'package:lifecare_app/app/modules/auth/domain/params/login_with_email_and_password_params.dart';
import 'package:lifecare_app/app/modules/auth/domain/entities/login_with_email_and_password_entity.dart';
import 'package:lifecare_app/app/modules/auth/infra/datasources/auth_datasource.dart';

class AuthDatasourceMockImpl implements AuthDatasource {
  @override
  Future<LoginWithEmailAndPasswordEntity> loginWithEmailAndPassword(LoginWithEmailAndPasswordParams params) async {
    return LoginWithEmailAndPasswordEntity(0, 'token', 'adby santos');
  }
}
