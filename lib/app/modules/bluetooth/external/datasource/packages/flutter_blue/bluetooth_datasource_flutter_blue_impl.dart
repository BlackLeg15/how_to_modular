import 'package:flutter_blue/flutter_blue.dart';

import '../../../../domain/params/listen_available_bluetooth_devices_params.dart';
import '../../../../domain/snapshot/listen_available_bluetooth_devices_snapshot.dart';
import '../../../../infra/datasources/bluetooth_datasource.dart';
import 'snapshot/available_blueooth_devices_blue_snapshot_impl.dart';

class BluetoothDatasourceFlutterBlueImpl implements BluetoothDatasource {
  final FlutterBlue flutterBlueInstance;

  BluetoothDatasourceFlutterBlueImpl(this.flutterBlueInstance);

  @override
  Future<ListenAvailableBluetoothDevicesSnapshot> listenAvailableBluetoothDevices(ListenAvailableBluetoothDevicesParams params) async {
    await flutterBlueInstance.startScan(timeout: const Duration(seconds: 5));
    return AvailableBluetoothDevicesBlueSnapshotImpl(flutterBlueInstance);
  }
}
