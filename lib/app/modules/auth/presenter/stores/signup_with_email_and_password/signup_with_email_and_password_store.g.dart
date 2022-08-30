// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_with_email_and_password_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignupWithEmailAndPasswordStore
    on SignupWithEmailAndPasswordStoreBase, Store {
  late final _$statusAtom = Atom(
      name: 'SignupWithEmailAndPasswordStoreBase.status', context: context);

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

  late final _$signupWithEmailAndPasswordAsyncAction = AsyncAction(
      'SignupWithEmailAndPasswordStoreBase.signupWithEmailAndPassword',
      context: context);

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
