import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lifecare_app/app/app_controller.dart';
import 'package:lifecare_app/app/modules/auth/auth_module.dart';
import 'package:lifecare_app/app/modules/home/home_module.dart';
import 'package:lifecare_app/app/modules/splash/splash_page.dart';
import 'package:lifecare_app/app/shared/stores/lazy_factory_store.dart';
import 'package:lifecare_app/app/shared/stores/lazy_singleton_store.dart';
import 'package:lifecare_app/app/shared/stores/not_lazy_singleton_store.dart';

import 'modules/app_repository.dart';
import 'modules/settings/settings_module.dart';

class AppModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    //Banco de Dados
    //Instancia do OneSignal (notificacao)
    
    //Bind((i) => HiveStorage()),
    Bind((i) => AppController()),
    Bind((i) => AppRepository()),

    //Testing binds
    Bind((i) => LazyFactoryStore(), isSingleton: false),
    Bind((i) => LazySingletonStore()),
    //Bind((i) => NotLazyFactoryStore(), isLazy: false, isSingleton: false),
    Bind((i) => NotLazySingletonStore(), isLazy: false),

    //Testing binds
    Bind.factory((i) => LazyFactoryStore()),
    Bind.lazySingleton((i) => LazySingletonStore()),
    //Bind((i) => NotLazyFactoryStore(), isLazy: false, isSingleton: false),
    Bind.singleton((i) => NotLazySingletonStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SplashPage()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/settings', module: SettingsModule()),
    ModuleRoute('/auth', module: AuthModule()),
    WildcardRoute(
        child: (_, args) => Scaffold(
              appBar: AppBar(title: Text('404 error')),
            ))
  ];
}
