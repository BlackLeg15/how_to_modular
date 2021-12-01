import 'package:flutter_modular/flutter_modular.dart';

import 'background_page.dart';

class BackgroundServiceModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const BackgroundPage())
      ];
}
