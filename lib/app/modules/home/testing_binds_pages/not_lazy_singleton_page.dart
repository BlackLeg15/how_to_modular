import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../widgets/listener_counter_widget.dart';
import '../../../shared/stores/not_lazy_singleton_store.dart';

class NotLazySingletonPage extends StatefulWidget {
  const NotLazySingletonPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<NotLazySingletonPage> createState() => _NotLazySingletonPageState();
}

class _NotLazySingletonPageState extends State<NotLazySingletonPage> {
  final store = Modular.get<NotLazySingletonStore>();

  @override
  Widget build(BuildContext context) {
    return ListenerCounterWidget(listenableValue: store.listenableValue);
  }
}
