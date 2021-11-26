import '../../params/listen_available_bluetooth_devices_params.dart';
import '../../repositories/bluetooth_repository.dart';
import '../../typedefs/listen_available_bluetooth_devices_typedef.dart';
import 'listen_available_bluetooth_devices_usecase.dart';

class ListenAvailableBluetoothDevicesUsecaseImpl implements ListenAvailableBluetoothDevicesUsecase {
  final BluetoothRepository repository;

  ListenAvailableBluetoothDevicesUsecaseImpl(this.repository);

  @override
  ListenAvailableBluetoothDevicesResult call(ListenAvailableBluetoothDevicesParams params) {
    return repository.listenAvailableBluetoothDevices(params);
  }
}
