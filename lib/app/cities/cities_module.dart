import 'package:RestaurantGuideFlutter/app/cities/cities_repository.dart';
import 'package:RestaurantGuideFlutter/app/restaurants/restaurants_module.dart';
import 'package:RestaurantGuideFlutter/app/restaurants/restaurants_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'cities_controller.dart';
import 'cities_page.dart';

class CitiesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CitiesController()),
        Bind((i) => CitiesRepository())
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => CitiesPage()),
        Router("/cities/city/restaurants/:cityId", module: RestaurantsModule())
      ];

  static Inject get to => Inject<CitiesModule>.of();
}
