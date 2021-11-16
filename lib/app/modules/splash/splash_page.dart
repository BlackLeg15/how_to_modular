import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.wait([
      //Modular.get<IStorageService>().init(),
      Future.delayed(const Duration(seconds: 4)),
    ]).then((value) {
      Modular.to.pushNamed('/home/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Center(child: Text('Minha Splash'))
        ],
      ),
    );
  }
}
