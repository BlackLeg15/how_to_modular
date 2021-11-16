import 'package:flutter/material.dart';

class ListenerCounterWidget extends StatelessWidget {
  final ValueNotifier<int> listenableValue;

  const ListenerCounterWidget({Key? key, required this.listenableValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Valor atual:',
            ),
            ValueListenableBuilder(
                valueListenable: listenableValue,
                builder: (context, value, child) {
                  return Text(
                    '$value',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
