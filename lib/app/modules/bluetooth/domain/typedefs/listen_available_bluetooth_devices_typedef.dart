import 'package:dartz/dartz.dart';

import '../entities/available_bluetooth_device_entity.dart';
import '../errors/listen_available_bluetooth_devices_errors.dart';

typedef ListenAvailableBluetoothDevicesResult = Future<Either<ListenAvailableBluetoothDevicesError, List<AvailableBluetoothDeviceEntity>>>;
