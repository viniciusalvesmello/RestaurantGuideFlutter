import 'package:flutter_modular/flutter_modular.dart';
import 'restaurants_controller.dart';
import 'restaurants_page.dart';

class RestaurantsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => RestaurantsController()),
      ];

  @override
  List<Router> get routers => [
        Router("/:cityId",
            child: (_, args) => RestaurantsPage(cityId: args.params["cityId"])),
      ];

  static Inject get to => Inject<RestaurantsModule>.of();
}
