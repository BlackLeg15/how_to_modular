import 'dart:async';

import 'package:flutter_blue/flutter_blue.dart';

import '../../../../../domain/entities/available_bluetooth_device_entity.dart';
import '../../../../../domain/snapshot/listen_available_bluetooth_devices_snapshot.dart';

class AvailableBluetoothDevicesBlueSnapshotImpl extends ListenAvailableBluetoothDevicesSnapshot {
  final FlutterBlue flutterBlueInstance;
  //StreamSubscription? _streamSubscription;

  AvailableBluetoothDevicesBlueSnapshotImpl(this.flutterBlueInstance);

  @override
  Future<void> close() async {
    await flutterBlueInstance.stopScan();
  }

  @override
  StreamSubscription<List<AvailableBluetoothDeviceEntity>> listen(void Function(List<AvailableBluetoothDeviceEntity> event)? onData, {Function? onError, void Function()? onDone, bool? cancelOnError}) {
    // _streamSubscription = Stream.periodic(const Duration(seconds: 5), (value) async {
    //   final myValue = await Future.value([
    //     AvailableBluetoothDeviceEntity('')
    //   ]);
    //   return myValue;
    // }).listen(onData);
    // return _streamSubscription;
    // Start scanning
    
    return flutterBlueInstance.scanResults
        .map((scanResultList) => scanResultList
            .map(
              (scanResult) => AvailableBluetoothDeviceEntity(scanResult.device.toString()),
            )
            .toList())
        .listen(onData);
  }
}
