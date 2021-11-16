import 'package:flutter_modular/flutter_modular.dart';
import 'package:lifecare_app/app/modules/home/testing_router_outlet/router_outlet_module.dart';

import 'home_page.dart';
import 'testing_binds_pages/lazy_factory_page.dart';
import 'testing_binds_pages/lazy_singleton_page.dart';
import 'testing_binds_pages/not_lazy_singleton_page.dart';

class HomeModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HomePage(title: 'Home Page')),
    ModuleRoute('/router_outlet', module: RouterOutletModule()),
    ChildRoute('/lf', child: (_, args) => const LazyFactoryPage(title: 'Lazy Factory Page')),
    ChildRoute('/ls', child: (_, args) => const LazySingletonPage(title: 'Lazy Singleton Page')),
    ChildRoute('/nls', child: (_, args) => const NotLazySingletonPage(title: 'Not Lazy Singleton Page')),
  ];
}