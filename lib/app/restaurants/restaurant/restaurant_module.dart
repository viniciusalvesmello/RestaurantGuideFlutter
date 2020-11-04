import 'package:RestaurantGuideFlutter/app/core/services/client_http_service.dart';
import 'package:RestaurantGuideFlutter/app/restaurants/restaurant/restaurant_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'restaurant_controller.dart';
import 'restaurant_page.dart';

class RestaurantModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IRestaurantRepository>(
          (i) => RestaurantRepository(
            client: i.get<IClientHttpService>(),
          ),
        ),
        Bind((i) => RestaurantController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => RestaurantPage()),
      ];

  static Inject get to => Inject<RestaurantModule>.of();
}
