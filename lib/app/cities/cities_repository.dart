import 'package:RestaurantGuideFlutter/app/cities/city/model/city_model.dart';

abstract class ICitiesRepository {
  List<City> getCities();
}

class CitiesRepository implements ICitiesRepository {
  @override
  List<City> getCities() {
    return [
      City(67, "São Paulo",
          "https://www.localizahertz.com/brasil-site/pt-br/rede-de-agencias/PublishingImages/Sao-Paulo/sao-paulo-cabecalho.jpg"),
      City(66, "Brasília",
          "https://media.melhoresdestinos.com.br/2019/02/passagens-aereas-brasilia-capa2019-01.jpg"),
    ];
  }
}
