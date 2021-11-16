import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'support_controller.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> with AutomaticKeepAliveClientMixin {
  late final SupportController controller;

  @override
  void initState() {
    super.initState();
    controller = Modular.get<SupportController>();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Support'),
        ),
        body: Center(
          child: FutureBuilder(
            future: controller.getValue(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              if (snapshot.data is int) {
                final value = snapshot.data;
                return Text('O valor buscado foi $value');
              }
              return Container();
            },
          ),
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
