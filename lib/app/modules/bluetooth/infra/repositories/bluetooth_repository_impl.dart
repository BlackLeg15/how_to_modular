import 'package:dartz/dartz.dart';

import '../../domain/errors/listen_available_bluetooth_devices_errors.dart';
import '../../domain/params/listen_available_bluetooth_devices_params.dart';
import '../../domain/repositories/bluetooth_repository.dart';
import '../../domain/typedefs/listen_available_bluetooth_devices_typedef.dart';
import '../datasources/bluetooth_datasource.dart';

class BluetoothRepositoryImpl implements BluetoothRepository {
  final BluetoothDatasource datasource;

  BluetoothRepositoryImpl(this.datasource);

  @override
  ListenAvailableBluetoothDevicesResult listenAvailableBluetoothDevices(ListenAvailableBluetoothDevicesParams params) {
    try {
      final result = datasource.listenAvailableBluetoothDevices(params);
      return Right(result);
    } catch (e, stacktrace) {
      return Left(UnknownListenAvailableBluetoothDevicesError('UnknownListenAvailableBluetoothDevicesError: $stacktrace'));
    }
  }
}
