import 'package:RestaurantGuideFlutter/app/core/services/client_http_service.dart';
import 'package:RestaurantGuideFlutter/app/restaurants/restaurant/restaurant_page.dart';
import 'package:RestaurantGuideFlutter/app/restaurants/restaurants_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'restaurants_controller.dart';
import 'restaurants_page.dart';

class RestaurantsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IRestaurantsRepository>((i) => RestaurantsRepository(
              client: i.get<IClientHttpService>(),
            )),
        Bind((i) => RestaurantsController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          "/:cityId/:cityName",
          child: (_, args) => RestaurantsPage(
            cityId: args.params["cityId"],
            cityName: args.params["cityName"],
          ),
        ),
        ModularRouter(
          "/restaurant/:restaurantId/:restaurantName",
          child: (_, args) => RestaurantPage(
            restaurantId: args.params["restaurantId"],
            restaurantName: args.params["restaurantName"],
          ),
        ),
      ];

  static Inject get to => Inject<RestaurantsModule>.of();
}
