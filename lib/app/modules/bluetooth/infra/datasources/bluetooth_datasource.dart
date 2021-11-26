import '../../domain/params/listen_available_bluetooth_devices_params.dart';
import '../../domain/typedefs/listen_available_bluetooth_devices_typedef.dart';

abstract class BluetoothDatasource {
  ListenAvailableBluetoothDevicesResult listenAvailableBluetoothDevices(ListenAvailableBluetoothDevicesParams params);
}
