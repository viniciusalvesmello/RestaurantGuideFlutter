import 'package:RestaurantGuideFlutter/app/app_widget.dart';
import 'package:RestaurantGuideFlutter/app/cities/cities_module.dart';
import 'package:RestaurantGuideFlutter/app/restaurants/restaurants_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/services/client_http_service.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind<IClientHttpService>((i) => ClientHttpService()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          module: CitiesModule(),
          transition: TransitionType.fadeIn,
        ),
        ModularRouter("/restaurants/", module: RestaurantsModule())
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
