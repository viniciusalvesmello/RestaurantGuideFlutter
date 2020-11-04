import 'package:RestaurantGuideFlutter/app/modules/restaurants/restaurants_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'cities_controller.dart';
import 'cities_page.dart';
import 'cities_repository.dart';

class CitiesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CitiesController()),
        Bind<ICitiesRepository>((i) => CitiesRepository())
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => CitiesPage()),
        ModularRouter(
          "/restaurants/:cityId/:cityName",
          module: RestaurantsModule(),
          transition: TransitionType.fadeIn,
        )
      ];

  static Inject get to => Inject<CitiesModule>.of();
}
