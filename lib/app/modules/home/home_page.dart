import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lifecare_app/app/app_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final appController = Modular.get<AppController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ListTile(
            //   title: Text('Go to page 1'),
            //   onTap: () {
            //     Modular.to.navigate('page1');
            //   },
            // ),
            // ListTile(
            //   title: Text('Go to page 2'),
            //   onTap: () {
            //     Modular.to.navigate('page2');
            //   },
            // ),
            // ListTile(
            //   title: Text('Go to page 3'),
            //   onTap: () {
            //     Modular.to.navigate('page3');
            //   },
            // ),
            // Expanded(
            //   child: RouterOutlet(),
            // ),
            ElevatedButton(
              onPressed: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));

                //Modular.to.pushNamed('settings', arguments: 'Adby Santos');

                //Modular.to.pushNamed('settings/123');

                //Modular.to.pushNamed('settings?name=Adby');

                Modular.to.pushNamed('lf');
              },
              child: const Text('Navegar para Lazy Factory'),
            ),
            ElevatedButton(
              onPressed: () => Modular.to.pushNamed('ls'),
              child: const Text('Navegar para Lazy Singleton'),
            ),
            ElevatedButton(
              onPressed: () => Modular.to.pushNamed('nls+'),
              child: const Text('Navegar para Not Lazy Singleton'),
            ),
            ElevatedButton(
              onPressed: () => Modular.to.navigate('router_outlet/messages'),
              child: const Text('Navegar para Router Outlet'),
            ),
          ],
        ),
      ),
    );
  }
}
