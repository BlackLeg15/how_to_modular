import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/stores/lazy_factory_store.dart';
import '../widgets/listener_counter_widget.dart';

class LazyFactoryPage extends StatefulWidget {
  const LazyFactoryPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LazyFactoryPage> createState() => _LazyFactoryPageState();
}

class _LazyFactoryPageState extends State<LazyFactoryPage> {
  final store = Modular.get<LazyFactoryStore>();

  @override
  Widget build(BuildContext context) {
    return ListenerCounterWidget(listenableValue: store.listenableValue);
  }
}
