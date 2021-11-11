import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lifecare_app/app/app_controller.dart';
import 'package:lifecare_app/app/modules/settings/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final AppController appController = Modular.get();
  final appController = Modular.get<AppController>();

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
                //Modular.to.pushNamed('settings', arguments: 'Adby Santos');
                Modular.to.pushNamed('settings/123');
                //Modular.to.pushNamed('settings?name=Adby');
              },
              child: const Text('Navegar para Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
