import 'package:flutter_modular/flutter_modular.dart';

import 'background_controller.dart';
import 'background_page.dart';

class BackgroundModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => BackgroundController(i()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const BackgroundPage())
      ];
}
