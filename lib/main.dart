import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:workmanager/workmanager.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //FlutterBackgroundService.initialize(onStart);

  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    if (task == 'Test Once') {
      debugPrint("Native called background task: $task"); //simpleTask will be emitted here.
      return Future.value(true);
    }
    if (task == 'Test Periodic') {
      debugPrint("Native called background task: $task"); //simpleTask will be emitted here.
      return Future.value(true);
    }
    return false;
  });
}
