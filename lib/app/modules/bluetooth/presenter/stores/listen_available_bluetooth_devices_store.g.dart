// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listen_available_bluetooth_devices_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListenAvailableBluetoothDevicesStore
    on _ListenAvailableBluetoothDevicesStoreBase, Store {
  final _$statusAtom =
      Atom(name: '_ListenAvailableBluetoothDevicesStoreBase.status');

  @override
  ListenAvailableBluetoothDevicesStoreState get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(ListenAvailableBluetoothDevicesStoreState value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  @override
  String toString() {
    return '''
status: ${status}
    ''';
  }
}
