import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lifecare_app/app/modules/home/widgets/listener_counter_widget.dart';
import 'package:lifecare_app/app/shared/stores/lazy_singleton_store.dart';

class LazySingletonPage extends StatefulWidget {
  const LazySingletonPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LazySingletonPage> createState() => _LazySingletonPageState();
}

class _LazySingletonPageState extends State<LazySingletonPage> {
  final store = Modular.get<LazySingletonStore>();

  @override
  Widget build(BuildContext context) {
    return ListenerCounterWidget(listenableValue: store.listenableValue);
  }
}
