// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_with_email_and_password_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignupWithEmailAndPasswordStore
    on _SignupWithEmailAndPasswordStoreBase, Store {
  final _$statusAtom =
      Atom(name: '_SignupWithEmailAndPasswordStoreBase.status');

  @override
  SignupWithEmailAndPasswordStoreState get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(SignupWithEmailAndPasswordStoreState value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$signupWithEmailAndPasswordAsyncAction = AsyncAction(
      '_SignupWithEmailAndPasswordStoreBase.signupWithEmailAndPassword');

  @override
  Future signupWithEmailAndPassword(String email, String password) {
    return _$signupWithEmailAndPasswordAsyncAction
        .run(() => super.signupWithEmailAndPassword(email, password));
  }

  @override
  String toString() {
    return '''
status: ${status}
    ''';
  }
}
