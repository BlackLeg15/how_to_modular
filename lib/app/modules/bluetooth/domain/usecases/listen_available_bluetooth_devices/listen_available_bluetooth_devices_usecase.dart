import '../../params/listen_available_bluetooth_devices_params.dart';

import '../../typedefs/listen_available_bluetooth_devices_typedef.dart';

abstract class ListenAvailableBluetoothDevicesUsecase {
  ListenAvailableBluetoothDevicesResult call(ListenAvailableBluetoothDevicesParams params);
}
