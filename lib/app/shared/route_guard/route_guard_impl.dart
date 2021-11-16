import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';

class RouteGuardImpl extends RouteGuard {
  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    Modular.to.pushNamed('settings');
    return false;
  }
}
