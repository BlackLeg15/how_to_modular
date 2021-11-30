import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/listen_available_bluetooth_devices/listen_available_bluetooth_devices_impl.dart';
import 'external/datasource/packages/flutter_blue/bluetooth_datasource_flutter_blue_impl.dart';
import 'infra/repositories/bluetooth_repository_impl.dart';
import 'presenter/bluetooth_page.dart';
import 'presenter/bluetooth_page_controller.dart';
import 'presenter/stores/listen_available_bluetooth_devices_store.dart';

class BluetoothModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => BluetoothPageController(i())),
        Bind((i) => ListenAvailableBluetoothDevicesStore(i())),
        Bind((i) => ListenAvailableBluetoothDevicesUsecaseImpl(i())),
        Bind((i) => BluetoothRepositoryImpl(i())),
        Bind((i) => BluetoothDatasourceFlutterBlueImpl(i())),
        Bind((i) => FlutterBlue.instance),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, child) => const BluetoothPage()),
      ];
}
