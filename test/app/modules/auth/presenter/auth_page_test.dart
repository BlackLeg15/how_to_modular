import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lifecare/app/modules/auth/auth_module.dart';
import 'package:lifecare/app/modules/auth/domain/usecases/login_with_email_and_password/login_with_email_and_password_usecase.dart';
import 'package:lifecare/app/modules/auth/presenter/auth_page.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';

class LoginWithEmailAndPasswordUsecaseMock extends Mock implements LoginWithEmailAndPasswordUsecase {}

void main() {
  setUpAll(() {
    initModules([
      AuthModule()
    ], replaceBinds: []);
  });

  group('AuthPage.loginWithEmailAndPassword', () {
    testWidgets(
      'Deve reagir normalmente',
      (tester) async {
        await tester.pumpWidget(const MaterialApp(home: AuthPage()));
        await tester.enterText(find.byKey(const Key('email_field')).first, 'adby@gmail.com');
        await tester.tap(find.byKey(const Key('login_button')).first);
        await tester.pump();
        expect(find.textContaining('adby santos'), findsOneWidget);
      },
    );
  });
}
