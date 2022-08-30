import 'package:mobx/mobx.dart';

import '../../../domain/params/signup_with_email_and_password_params.dart';
import '../../../domain/usecases/signup_with_email_and_password/signup_with_email_and_password_usecase.dart';
import 'states/signup_with_email_and_password_store_states.dart';

part 'signup_with_email_and_password_store.g.dart';

class SignupWithEmailAndPasswordStore = SignupWithEmailAndPasswordStoreBase with _$SignupWithEmailAndPasswordStore;

abstract class SignupWithEmailAndPasswordStoreBase with Store {
  final SignupWithEmailAndPasswordUsecase usecase;

  SignupWithEmailAndPasswordStoreBase(this.usecase);

  @observable
  SignupWithEmailAndPasswordStoreState status = SignupWithEmailAndPasswordStoreInitialState();

  @action
  signupWithEmailAndPassword(String email, String password) async {
    status = SignupWithEmailAndPasswordStoreLoadingState();
    final result = await usecase(SignupWithEmailAndPasswordParams(email, password));
    result.fold((error) {
      status = SignupWithEmailAndPasswordStoreErrorState(message: error.message);
    }, (signupEntity) {
      status = SignupWithEmailAndPasswordStoreLoadedState(entity: signupEntity);
    });
  }
}
