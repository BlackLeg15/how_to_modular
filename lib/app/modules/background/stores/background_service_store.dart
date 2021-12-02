import 'package:flutter/services.dart';

class BackgroundServiceStore {
  late final MethodChannel platform;

  BackgroundServiceStore() {
    platform = const MethodChannel('background_location_service');
  }
}
