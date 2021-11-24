import 'package:flutter_modular/flutter_modular.dart';
import 'package:lifecare/app/modules/settings/settings_page.dart';

class SettingsModule extends Module {
  @override
  final List<ModularRoute> routes = [
    //ChildRoute('/', child: (_, args) => SettingsPage(username: args.data))
    ChildRoute('/:id', child: (_, args) => SettingsPage(username: args.params['id']))
    // ChildRoute('/', child: (_, args) => SettingsPage(username: args.queryParams['name']))
  ];
}