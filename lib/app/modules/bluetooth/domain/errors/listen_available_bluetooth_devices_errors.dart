import '../../../../shared/errors/lifecare_exception.dart';

abstract class ListenAvailableBluetoothDevicesError extends LifecareException {
  ListenAvailableBluetoothDevicesError(String message) : super(message: message);
}

class UnknownListenAvailableBluetoothDevicesError extends ListenAvailableBluetoothDevicesError {
  UnknownListenAvailableBluetoothDevicesError(String message) : super(message);
}
