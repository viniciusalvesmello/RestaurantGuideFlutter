import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app_widget.dart';
import 'core/services/client_http_service.dart';
import 'modules/cities/cities_module.dart';
import 'modules/restaurants/restaurants_module.dart';

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
