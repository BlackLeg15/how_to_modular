import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RouterOutletPage extends StatelessWidget {
  const RouterOutletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Modular.to.navigate('/home/');
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Router Outlet'),
        ),
        body: Column(
          children: [
            Text(
              'Bem-vindo',
              style: TextStyle(fontSize: 40),
            ),
            Expanded(child: RouterOutlet()),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    Modular.to.navigate('messages');
                  },
                  child: Text('Mensagens')),
              TextButton(
                  onPressed: () {
                    Modular.to.navigate('calls');
                  },
                  child: Text('Ligações')),
              TextButton(
                  onPressed: () {
                    Modular.to.navigate('e-mails');
                  },
                  child: Text('E-mails')),
              TextButton(
                  onPressed: () {
                    Modular.to.navigate('support');
                  },
                  child: Text('Suporte')),
            ],
          ),
        ),
      ),
    );
  }
}
