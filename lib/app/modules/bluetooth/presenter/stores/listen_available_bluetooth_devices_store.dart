import 'dart:async';

import 'package:mobx/mobx.dart';

import '../../domain/params/listen_available_bluetooth_devices_params.dart';
import '../../domain/snapshot/listen_available_bluetooth_devices_snapshot.dart';
import '../../domain/usecases/listen_available_bluetooth_devices/listen_available_bluetooth_devices_usecase.dart';
import 'states/listen_available_bluetooth_devices_store_states.dart';

part 'listen_available_bluetooth_devices_store.g.dart';

class ListenAvailableBluetoothDevicesStore = _ListenAvailableBluetoothDevicesStoreBase with _$ListenAvailableBluetoothDevicesStore;

abstract class _ListenAvailableBluetoothDevicesStoreBase with Store {
  final ListenAvailableBluetoothDevicesUsecase usecase;

  @observable
  ListenAvailableBluetoothDevicesStoreState status = ListenAvailableBluetoothDevicesStoreInitialState();

  ListenAvailableBluetoothDevicesSnapshot? _devicesSnapshot;

  _ListenAvailableBluetoothDevicesStoreBase(this.usecase);

  Future<void> initScan() async {
    status = ListenAvailableBluetoothDevicesStoreLoadingState();
    if (_devicesSnapshot != null) {
      await _devicesSnapshot!.close();
      _devicesSnapshot = null;
    }
    await usecase(ListenAvailableBluetoothDevicesParams()).then((value) {
      value.fold((error) {
        status = ListenAvailableBluetoothDevicesStoreErrorState(message: error.message);
      }, (snapshot) {
        _devicesSnapshot = snapshot;
        _devicesSnapshot!.listen((entitiesList) {
          status = ListenAvailableBluetoothDevicesStoreLoadedState(entities: entitiesList);
        });
      });
    });
  }

  Future<void> stopScan() async {
    status = ListenAvailableBluetoothDevicesStoreLoadingState();
    if (_devicesSnapshot != null) {
      await _devicesSnapshot!.close();
    }
    status = ListenAvailableBluetoothDevicesStoreInitialState();
  }
}
