import 'package:flutter/foundation.dart';

abstract class CounterStore {
  final listenableValue = ValueNotifier<int>(0);

  CounterStore() {
    _incrementValue();
  }

  void _incrementValue() {
    listenableValue.value = listenableValue.value + 1;
    Future.delayed(const Duration(seconds: 1), _incrementValue);
  }
}
