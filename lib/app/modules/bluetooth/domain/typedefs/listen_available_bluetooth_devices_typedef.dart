import 'package:dartz/dartz.dart';

import '../errors/listen_available_bluetooth_devices_errors.dart';
import '../snapshot/listen_available_bluetooth_devices_snapshot.dart';

typedef ListenAvailableBluetoothDevicesResult = Future<Either<ListenAvailableBluetoothDevicesError, ListenAvailableBluetoothDevicesSnapshot>>;
