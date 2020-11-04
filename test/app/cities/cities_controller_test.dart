import 'package:RestaurantGuideFlutter/app/app_module.dart';
import 'package:RestaurantGuideFlutter/app/modules/cities/cities_controller.dart';
import 'package:RestaurantGuideFlutter/app/modules/cities/cities_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  initModule(AppModule());
  initModule(CitiesModule());

  test('when get list cities should get data with success', () {
    final CitiesController controller = Modular.get();
    controller.getCities();

    expect(controller.cities[0].id, 67);
    expect(controller.cities[0].name, "São Paulo");
    expect(controller.cities[0].imageUrl,
        "https://www.localizahertz.com/brasil-site/pt-br/rede-de-agencias/PublishingImages/Sao-Paulo/sao-paulo-cabecalho.jpg");

    expect(controller.cities[1].id, 66);
    expect(controller.cities[1].name, "Brasília");
    expect(controller.cities[1].imageUrl,
        "https://media.melhoresdestinos.com.br/2019/02/passagens-aereas-brasilia-capa2019-01.jpg");
  });
}
