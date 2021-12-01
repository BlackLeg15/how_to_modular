import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'bluetooth_page_controller.dart';
import 'stores/states/listen_available_bluetooth_devices_store_states.dart';

class BluetoothPage extends StatefulWidget {
  const BluetoothPage({Key? key}) : super(key: key);

  @override
  _BluetoothPageState createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<BluetoothPage> with WidgetsBindingObserver {
  final controller = Modular.get<BluetoothPageController>();
  //TextEditingController

  @override
  void initState() {
    super.initState();
    controller.initScan();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //if (state == AppLifecycleState.paused) {}
    //if (state == AppLifecycleState.resumed) {}
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Observer(builder: (context) {
          final bluetoothStore = controller.listenAvailableBluetoothDevicesStore;
          final bluetoothStoreStatus = bluetoothStore.status;
          if (bluetoothStoreStatus is ListenAvailableBluetoothDevicesStoreLoadedState) {
            final entityList = bluetoothStoreStatus.entities;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: entityList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(entityList[index].description),
                        );
                      }),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.initScan();
                  },
                  child: const Text('Init scan'),
                ),
              ],
            );
          }
          if (bluetoothStoreStatus is ListenAvailableBluetoothDevicesStoreLoadingState) {
            return const CircularProgressIndicator.adaptive();
          }
          if (bluetoothStoreStatus is ListenAvailableBluetoothDevicesStoreInitialState) {
            return ElevatedButton(
              onPressed: () {
                controller.initScan();
              },
              child: const Text('Init scan'),
            );
          }
          return Container();
        }));
  }
}
