import 'package:RestaurantGuideFlutter/app/core/services/client_http_service.dart';
import 'package:RestaurantGuideFlutter/app/restaurants/restaurants_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'restaurants_controller.dart';
import 'restaurants_page.dart';

class RestaurantsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => RestaurantsRepository(i.get<IClientHttpService>())),
        Bind((i) => RestaurantsController()),
      ];

  @override
  List<Router> get routers => [
        Router(
          "/:cityId/:cityName",
          child: (_, args) => RestaurantsPage(
            cityId: args.params["cityId"],
            cityName: args.params["cityName"],
          ),
        ),
      ];

  static Inject get to => Inject<RestaurantsModule>.of();
}
