import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'modules/app_repository.dart';
import 'modules/auth/auth_module.dart';
import 'modules/bluetooth/bluetooth_module.dart';
import 'modules/home/home_module.dart';
import 'modules/settings/settings_module.dart';
import 'modules/splash/splash_page.dart';
import 'shared/stores/lazy_factory_store.dart';
import 'shared/stores/lazy_singleton_store.dart';
import 'shared/stores/not_lazy_singleton_store.dart';

class AppModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    //Instancia do Banco de Dados
    //Instancia do OneSignal (notificacao)
    
    //Bind((i) => HiveStorage()),
    Bind((i) => AppController()),
    Bind((i) => AppRepository()),

    //Testing binds
    Bind((i) => LazyFactoryStore(), isSingleton: false),
    Bind((i) => LazySingletonStore()),
    //Bind((i) => NotLazyFactoryStore(), isLazy: false, isSingleton: false),
    Bind((i) => NotLazySingletonStore(), isLazy: false),

    //Testing binds (alternative)
    // Bind.factory((i) => LazyFactoryStore()),
    // Bind.lazySingleton((i) => LazySingletonStore()),
    // //Bind((i) => NotLazyFactoryStore(), isLazy: false, isSingleton: false),
    // Bind.singleton((i) => NotLazySingletonStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SplashPage()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/settings', module: SettingsModule()),
    ModuleRoute('/auth', module: AuthModule()),
    ModuleRoute('/bluetooth', module: BluetoothModule()),
    WildcardRoute(
        child: (_, args) => Scaffold(
              appBar: AppBar(title: const Text('404 error')),
            ))
  ];
}
