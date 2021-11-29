import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BluetoothModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => FlutterBlue.instance),
      ];

  @override
  List<ModularRoute> get routes => [];
}
