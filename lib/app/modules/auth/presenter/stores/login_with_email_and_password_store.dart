import 'package:lifecare_app/app/modules/auth/domain/usecases/login_with_email_and_password/login_with_email_and_password_usecase.dart';
import 'package:mobx/mobx.dart';
part 'login_with_email_and_password_store.g.dart';

class LoginWithEmailAndPasswordStore = _LoginWithEmailAndPasswordStoreBase with _$LoginWithEmailAndPasswordStore;

abstract class _LoginWithEmailAndPasswordStoreBase with Store {
  final LoginWithEmailAndPasswordUsecase usecase;

  _LoginWithEmailAndPasswordStoreBase(this.usecase);
}
