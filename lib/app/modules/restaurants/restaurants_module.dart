import 'package:RestaurantGuideFlutter/app/core/services/client_http_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'restaurant/restaurant_module.dart';
import 'restaurants_controller.dart';
import 'restaurants_page.dart';
import 'restaurants_repository.dart';

class RestaurantsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IRestaurantsRepository>(
          (i) => RestaurantsRepository(
            client: i.get<IClientHttpService>(),
          ),
        ),
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
          "/restaurant/",
          module: RestaurantModule(),
        ),
      ];

  static Inject get to => Inject<RestaurantsModule>.of();
}
