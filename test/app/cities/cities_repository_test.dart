import 'package:RestaurantGuideFlutter/app/modules/cities/cities_repository.dart';
import 'package:RestaurantGuideFlutter/app/modules/cities/city/model/city_model.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('when get list cities should get data with success', () {
    final ICitiesRepository repository = CitiesRepository();
    final List<City> list = repository.getCities();

    expect(list[0].id, 67);
    expect(list[0].name, "São Paulo");
    expect(list[0].imageUrl,
        "https://www.localizahertz.com/brasil-site/pt-br/rede-de-agencias/PublishingImages/Sao-Paulo/sao-paulo-cabecalho.jpg");

    expect(list[1].id, 66);
    expect(list[1].name, "Brasília");
    expect(list[1].imageUrl,
        "https://media.melhoresdestinos.com.br/2019/02/passagens-aereas-brasilia-capa2019-01.jpg");
  });
}
