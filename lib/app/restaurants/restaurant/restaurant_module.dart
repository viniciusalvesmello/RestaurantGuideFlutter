import 'package:flutter_modular/flutter_modular.dart';

import 'restaurant_controller.dart';
import 'restaurant_page.dart';

class RestaurantModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => RestaurantController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => RestaurantPage()),
      ];

  static Inject get to => Inject<RestaurantModule>.of();
}
