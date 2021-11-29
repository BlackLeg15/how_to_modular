import '../../domain/params/listen_available_bluetooth_devices_params.dart';
import '../../domain/snapshot/listen_available_bluetooth_devices_snapshot.dart';

abstract class BluetoothDatasource {
  ListenAvailableBluetoothDevicesSnapshot listenAvailableBluetoothDevices(ListenAvailableBluetoothDevicesParams params);
}
