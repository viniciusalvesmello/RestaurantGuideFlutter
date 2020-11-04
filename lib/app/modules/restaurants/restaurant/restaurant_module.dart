import 'package:RestaurantGuideFlutter/app/core/services/client_http_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'restaurant_controller.dart';
import 'restaurant_page.dart';
import 'restaurant_repository.dart';

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
        ModularRouter(
          Modular.initialRoute,
          child: (_, args) => RestaurantPage(restaurant: args.data),
        ),
      ];

  static Inject get to => Inject<RestaurantModule>.of();
}
