import 'package:flutter/foundation.dart';
import 'stores/background_service_store.dart';

class BackgroundController {
  final BackgroundServiceStore backgroundServiceStore;

  BackgroundController(this.backgroundServiceStore);

  void startLocationService() async {
    final result = await backgroundServiceStore.platform.invokeMethod('startLocationService');
    debugPrint(result.toString());
  }
  void stopLocationService() async {
    final result = await backgroundServiceStore.platform.invokeMethod('stopLocationService');
    debugPrint(result.toString());
  }
}
