import '../../../domain/entities/available_bluetooth_device_entity.dart';

abstract class ListenAvailableBluetoothDevicesStoreState {
  const ListenAvailableBluetoothDevicesStoreState();
}

class ListenAvailableBluetoothDevicesStoreInitialState extends ListenAvailableBluetoothDevicesStoreState {}

class ListenAvailableBluetoothDevicesStoreLoadingState extends ListenAvailableBluetoothDevicesStoreState {}

class ListenAvailableBluetoothDevicesStoreLoadedState extends ListenAvailableBluetoothDevicesStoreState {
  final List<AvailableBluetoothDeviceEntity> entities;

  ListenAvailableBluetoothDevicesStoreLoadedState({required this.entities});
}

class ListenAvailableBluetoothDevicesStoreErrorState extends ListenAvailableBluetoothDevicesStoreState {
  final String message;

  ListenAvailableBluetoothDevicesStoreErrorState({required this.message});
}
