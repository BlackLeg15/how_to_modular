import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:workmanager/workmanager.dart';

import '../../../../../main.dart';
import '../stores/signup_with_email_and_password/states/signup_with_email_and_password_store_states.dart';
import 'signup_controller.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final SignupController controller = Modular.get();
  late final ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();
    disposer = autorun((_) {
      final loginWithEmailStore = controller.signupWithEmailAndPasswordStore;
      final storeStatus = loginWithEmailStore.status;
      if (storeStatus is SignupWithEmailAndPasswordStoreErrorState) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(storeStatus.message)));
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
          final loginWithEmailStore = controller.signupWithEmailAndPasswordStore;
          final storeStatus = loginWithEmailStore.status;
          if (storeStatus is SignupWithEmailAndPasswordStoreErrorState) {
            return const Text('Signup Error :(');
          }
          if (storeStatus is SignupWithEmailAndPasswordStoreLoadingState) {
            return const CircularProgressIndicator(color: Colors.white);
          }
          if (storeStatus is SignupWithEmailAndPasswordStoreLoadedState) {
            return Text('SignupPage: ${storeStatus.entity.username}');
          }
          return const Text('SignupPage: not logged');
        }),
      ),
      body: Column(
        children: [
          TextField(
            //key: const Key('email_field'),
            decoration: const InputDecoration(label: Text('E-mail')),
            controller: controller.emailController,
          ),
          TextField(
            //key: Key('pass_field'),
            decoration: const InputDecoration(label: Text('Password')),
            controller: controller.passwordController,
          ),
          ElevatedButton(
            //key: Key('signup_button'),
            onPressed: controller.signupWithEmailAndPassword,
            child: const Text('Signup with email and password'),
          ),
          ElevatedButton(
            //key: Key('signup_button'),
            onPressed: () {
              Workmanager()
                  .initialize(
                callbackDispatcher,
                isInDebugMode: true,
              )
                  .then((value) {
                Workmanager().registerOneOffTask('test_once', 'Test Once', initialDelay: const Duration(seconds: 20));
                Workmanager().registerPeriodicTask('test_periodic', 'Test Periodic');
              });
            },
            child: const Text('Workmanager'),
          ),
        ],
      ),
    );
  }
}
