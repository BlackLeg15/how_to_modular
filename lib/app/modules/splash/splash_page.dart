import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.wait([
      //Modular.get<IStorageService>().init(),
      Firebase.initializeApp(),
      Future.delayed(const Duration(seconds: 4)),
    ]).then((value) {
      //Modular.to.pushNamed('/home/');
      //Modular.to.pushNamed('/auth/');
      //Modular.to.pushNamed('/bluetooth/');
      Modular.to.pushReplacementNamed('/background/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: const [
          Center(child: Text('Minha Splash'))
        ],
      ),
    );
  }
}
