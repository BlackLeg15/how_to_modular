import 'dart:async';

import '../entities/available_bluetooth_device_entity.dart';

abstract class ListenAvailableBluetoothDevicesSnapshot extends Stream<List<AvailableBluetoothDeviceEntity>> {
  Future<void> close();
}
