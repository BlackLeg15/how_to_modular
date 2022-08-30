import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'background_controller.dart';

class BackgroundPage extends StatefulWidget {
  const BackgroundPage({Key? key}) : super(key: key);

  @override
  createState() => _BackgroundPageState();
}

class _BackgroundPageState extends State<BackgroundPage> {
  late final BackgroundController controller;

  @override
  void initState() {
    super.initState();
    controller = Modular.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: controller.startLocationService, child: const Text('Start location service')),
        ],
      ),
    );
  }
}
