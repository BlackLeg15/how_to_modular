import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lifecare_app/app/modules/home/testing_router_outlet/modules/support/support_controller.dart';
import 'package:lifecare_app/app/modules/home/testing_router_outlet/modules/support/support_page.dart';

class SupportModule extends WidgetModule {
  SupportModule({Key? key}) : super(key: key);

  @override
  List<Bind<Object>> get binds => [
        Bind((i) => SupportController()),
      ];

  @override
  Widget get view => const SupportPage();
}
