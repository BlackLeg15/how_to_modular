import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'auth_controller.dart';
import 'stores/login_with_email_and_password/states/login_with_email_and_password_store_states.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final AuthController authController = Modular.get();
  late final ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();
    disposer = autorun((_) {
      final loginWithEmailStore = authController.loginWithEmailAndPasswordStore;
      final storeStatus = loginWithEmailStore.status;
      if (storeStatus is LoginWithEmailAndPasswordStoreErrorState) {
        var message = storeStatus.message;
        if (message.length > 200) {
          message = message.substring(0, 200);
        }
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
      }
    });
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          final loginWithEmailStore = authController.loginWithEmailAndPasswordStore;
          final storeStatus = loginWithEmailStore.status;
          if (storeStatus is LoginWithEmailAndPasswordStoreErrorState) {
            return const Text('Login Error :(');
          }
          if (storeStatus is LoginWithEmailAndPasswordStoreLoadingState) {
            return const CircularProgressIndicator(color: Colors.white);
          }
          if (storeStatus is LoginWithEmailAndPasswordStoreLoadedState) {
            return Text('AuthPage: ${storeStatus.entity.username}');
          }
          return const Text('AuthPage: not logged');
        }),
      ),
      body: Column(
        children: [
          TextField(
            key: const Key('email_field'),
            decoration: const InputDecoration(label: Text('E-mail')),
            controller: authController.emailController,
          ),
          TextField(
            key: const Key('pass_field'),
            decoration: const InputDecoration(label: Text('Password')),
            controller: authController.passwordController,
          ),
          ElevatedButton(
            key: const Key('login_button'),
            onPressed: authController.loginWithEmailAndPassword,
            child: const Text('Login with email and password'),
          ),
          ElevatedButton(
            onPressed: () {
              Modular.to.pushNamed('signup');
            },
            child: const Text('Go to signup'),
          )
        ],
      ),
    );
  }
}
