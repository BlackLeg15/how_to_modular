import 'package:flutter_modular/flutter_modular.dart';

import 'pages/messages_page.dart';
import 'modules/support/support_module.dart';
import 'pages/calls_page.dart';
import 'pages/emails_page.dart';
import 'router_outlet_page.dart';

class RouterOutletModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const RouterOutletPage(), children: [
          ChildRoute('/messages', child: (_, args) => MessagesPage()),
          ChildRoute('/calls', child: (_, args) => CallsPage()),
          ChildRoute('/e-mails', child: (_, args) => EmailsPage()),
          ChildRoute('/support', child: (_, args) => SupportModule()),
        ]),
      ];
}
