import 'package:flutter_modular/flutter_modular.dart';
import 'package:lifecare_app/app/app_controller.dart';
import 'package:lifecare_app/app/modules/home/home_module.dart';

import 'modules/app_repository.dart';
import 'modules/settings/settings_module.dart';

class AppModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    //Banco de Dados
    //Instancia do OneSignal (notificacao)
    //HiveStorage (Local Storage)
    Bind((i) => AppController(appRepository: i())),
    Bind((i) => AppRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),
    ModuleRoute('/settings', module: SettingsModule())
  ];
}