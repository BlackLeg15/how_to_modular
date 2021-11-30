import 'stores/listen_available_bluetooth_devices_store.dart';

class BluetoothPageController {
  final ListenAvailableBluetoothDevicesStore listenAvailableBluetoothDevicesStore;

  BluetoothPageController(this.listenAvailableBluetoothDevicesStore);

  void initScan() {
    listenAvailableBluetoothDevicesStore.initScan();
  }
}
