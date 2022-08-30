import 'package:mobx/mobx.dart';

import '../../../domain/params/login_with_email_and_password_params.dart';
import '../../../domain/usecases/login_with_email_and_password/login_with_email_and_password_usecase.dart';
import 'states/login_with_email_and_password_store_states.dart';

part 'login_with_email_and_password_store.g.dart';

class LoginWithEmailAndPasswordStore = LoginWithEmailAndPasswordStoreBase with _$LoginWithEmailAndPasswordStore;

abstract class LoginWithEmailAndPasswordStoreBase with Store {
  final LoginWithEmailAndPasswordUsecase usecase;

  LoginWithEmailAndPasswordStoreBase(this.usecase);

  @observable
  LoginWithEmailAndPasswordStoreState status = LoginWithEmailAndPasswordStoreInitialState();

  @action
  loginWithEmailAndPassword(String email, String password) async {
    status = LoginWithEmailAndPasswordStoreLoadingState();
    final result = await usecase(LoginWithEmailAndPasswordParams(email, password));
    result.fold((error) {
      status = LoginWithEmailAndPasswordStoreErrorState(message: error.message);
    }, (loginEntity) {
      status = LoginWithEmailAndPasswordStoreLoadedState(entity: loginEntity);
    });
  }
}
