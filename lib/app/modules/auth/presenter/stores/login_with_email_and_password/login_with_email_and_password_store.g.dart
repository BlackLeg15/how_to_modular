// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_with_email_and_password_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginWithEmailAndPasswordStore
    on _LoginWithEmailAndPasswordStoreBase, Store {
  final _$statusAtom = Atom(name: '_LoginWithEmailAndPasswordStoreBase.status');

  @override
  LoginWithEmailAndPasswordStoreState get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(LoginWithEmailAndPasswordStoreState value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$loginWithEmailAndPasswordAsyncAction = AsyncAction(
      '_LoginWithEmailAndPasswordStoreBase.loginWithEmailAndPassword');

  @override
  Future loginWithEmailAndPassword(String email, String password) {
    return _$loginWithEmailAndPasswordAsyncAction
        .run(() => super.loginWithEmailAndPassword(email, password));
  }

  @override
  String toString() {
    return '''
status: ${status}
    ''';
  }
}
