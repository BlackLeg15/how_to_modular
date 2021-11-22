import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lifecare_app/app/modules/auth/presenter/auth_controller.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final AuthController authController = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auth Page: ${authController.username ?? 'Not logged'}'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(label: Text('E-mail')),
            controller: authController.emailController,
          ),
          TextField(
            decoration: const InputDecoration(label: Text('Password')),
            controller: authController.passwordController,
          ),
          ElevatedButton(
              onPressed: () async {
                await authController.loginWithEmailAndPassword();
                setState(() {});
              },
              child: Text('Login with email and password'))
        ],
      ),
    );
  }
}
